desc "Process twits to create articles"
task :process_twits => :environment do
  require 'uri'
  articles_created = 0
  errors = 0
  twits = Twit.not_processed(:order => "id asc").limit(50)
  twits.each do |t|
    urls = URI.extract(t.text)
    unless urls.empty?
      urls.each do |u|
        begin
          doc = Pismo::Document.new(u)
          unless doc.title.nil?
            article = Article.create(
              :title => doc.title,
              :author => doc.author,
              :body => doc.body,
              :body_html => doc.html_body,
              :url => u,
              :description => doc.lede,
              :date_published => doc.datetime,
              :source_id => t.source_id,
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
  puts(articles_created.to_s + " articulos fueron creados")
  puts(errors.to_s + " errores encontrados")
end