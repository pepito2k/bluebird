desc "Process twits to create articles"
task :process_twits => :environment do
  QUANTITY = 150
  bar = RakeProgressbar.new(QUANTITY)
  require 'uri'
  articles_created = 0
  errors = 0
  twits = Twit.not_processed(:order => "id asc").limit(QUANTITY)
  twits.each do |t|
    urls = URI.extract(t.text)
    bar.inc
    unless urls.empty?
      urls.each do |u|
        begin
          doc = Pismo::Document.new(u)
          unless doc.title.nil?
            image_url_temp = URI.extract(doc.html_body).first 
            image_url = (FastImage.type(image_url_temp).nil?) ? nil : image_url_temp
            article = Article.create(
              :twit_id => t.id,
              :title => doc.title,
              :author => doc.author,
              :body => doc.body,
              :body_html => doc.html_body,
              :url => u,
              :description => doc.lede,
              :date_published => doc.datetime,
              :source_id => t.source_id,
              :image_url => image_url
            )
            articles_created += 1
          end
        rescue Exception => e
          errors += 1
        end
      end
    end
  end
  twits.update_all(:processed => true)
  bar.finished
  puts(articles_created.to_s + " articulos fueron creados")
  puts(errors.to_s + " errores encontrados")
end