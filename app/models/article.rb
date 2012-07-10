class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :body_html, :url, :description, :date_published, :source_id, :twit_id, :image_url,
                  :facebook_shares, :facebook_likes, :facebook_comments, :url_extended

  belongs_to :source
  belongs_to :twit

  validates_presence_of :title, :url

  scope :active, where(:active => true)

  delegate :retweet_count, :to => :twit, :prefix => true
  delegate :name, :to => :source, :prefix => true

  before_save :get_shares

  def get_shares
  	get_facebook_shares
    get_twitter_shares
    get_digg_shares
    get_delicious_shares
  end

  def calc_weight
    divider = (image_url) ? 1 : 5
    (facebook_shares + facebook_likes + facebook_comments + twitter_shares + digg_shares + delicious_shares) / divider
  end

  def get_facebook_shares
  	begin
      facebook_json_object   = JSON.parse(open("https://graph.facebook.com/fql?q=SELECT%20share_count,%20like_count,%20comment_count%20FROM%20link_stat%20WHERE%20url='#{url_extended}'").read)
      self.facebook_shares   = facebook_json_object['data'][0]['share_count'].to_i
      self.facebook_likes    = facebook_json_object['data'][0]['like_count'].to_i
      self.facebook_comments = facebook_json_object['data'][0]['comment_count'].to_i
    rescue
    end
  end

  def get_twitter_shares
    begin
      twitter_json_object = JSON.parse(open("http://otter.topsy.com/stats.json?url=#{url}").read)
      self.twitter_shares = twitter_json_object['response']['all']
    rescue
    end
  end

  def get_digg_shares
    begin
      digg_json_object = JSON.parse(open("http://services.digg.com/1.0/endpoint?method=story.getAll&amp;link=#{url_extended}&amp;type=json").read)
      self.digg_shares = digg_json_object['count']
    rescue
    end
  end

  def get_delicious_shares
    begin
      delicious_json_object = JSON.parse(open("http://feeds.delicious.com/v2/json/urlinfo/data?url=#{url_extended}").read)
      self.delicious_shares = delicious_json_object[0]['total_posts']
    rescue
    end
  end
end
