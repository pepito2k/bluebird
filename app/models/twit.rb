class Twit < ActiveRecord::Base
  attr_accessible :created_at, :twit_id, :text, :retweet_count, :favorited, :retweeted

  has_many :articles
  belongs_to :source

  scope :not_processed, where(:processed => false)
  scope :processed, where(:processed => true)

  def process
    urls = URI.extract(text)
    unless urls.empty?
      urls.each do |u|
        begin
          doc = Pismo::Document.new(u)
          unless doc.title.nil?
            image_url_temp = URI.extract(doc.html_body).first
            image_url = (FastImage.type(image_url_temp).nil?) ? nil : image_url_temp
            article = Article.create(
              :twit_id => id,
              :title => doc.title,
              :author => doc.author,
              :body => doc.body,
              :body_html => doc.html_body,
              :url => u,
              :url_extended => URI.escape(Unshorten[u]).split('?').first,
              :description => doc.lede,
              :date_published => doc.datetime,
              :source_id => source_id,
              :image_url => image_url
            )
          end
        rescue Exception => e
        end
      end
    end
  self.update_attribute(:processed, true)
  end
end