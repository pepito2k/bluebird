desc "Process twits to create articles"
task :process_twits => :environment do
  QUANTITY = 150
  bar = RakeProgressbar.new(QUANTITY)
  require 'uri'
  twits = Twit.not_processed(:order => "id asc").limit(QUANTITY)
  twits.each do |t|
    bar.inc
    t.process
  end
  bar.finished
end