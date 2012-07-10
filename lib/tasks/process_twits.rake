desc "Process twits to create articles"
task :process_twits => :environment do
  QUANTITY = 150
  bar = RakeProgressbar.new(QUANTITY)
  require 'uri'
  articles_created = 0
  errors = 0
  twits = Twit.not_processed(:order => "id asc").limit(QUANTITY)
  twits.each do |t|
    bar.inc
    t.process
  end
  bar.finished
  puts(articles_created.to_s + " articulos fueron creados")
  puts(errors.to_s + " errores encontrados")
end