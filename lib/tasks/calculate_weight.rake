desc "Calculate Article's Weight"
task :calculate_weight => :environment do
  require 'open-uri'
  require 'json'

  FACEBOOK_TOKEN = "AAADnKwqiSd8BAA8OSCI38k9LQnfqcTZB8cSPCKRb4lBuYpzOZB5NsB9Yq9cmROOprEQY3yoymYMFcGhJXTVaFrXzIBZADcZD"
  GOOGLE_PULS_TOKEN = "AIzaSyA8tnN9xmkq3FPtqDfxSKVKkgRfgAArXa4"

  articles = Article.order("id desc").limit(50)
  articles.each do |article|
    url = URI.escape(Unshorten[article.url]).split('?').first
    puts '** ' + url

    begin
      facebook_json_object = JSON.parse(open("https://graph.facebook.com/#{url}?access_token=#{FACEBOOK_TOKEN}").read)
      article.facebook_shares = facebook_json_object['shares']
      puts '* facebook done!'
    rescue
      puts '* facebook failed :('
    end

    begin
      twitter_json_object = JSON.parse(open("http://otter.topsy.com/stats.json?url=#{article.url}").read)
      article.twitter_shares = twitter_json_object['response']['all']
      puts '* twitter done!'
    rescue
      puts '* twitter failed :('
    end

    begin
      digg_json_object = JSON.parse(open("http://services.digg.com/1.0/endpoint?method=story.getAll&amp;link=#{url}&amp;type=json").read)
      article.digg_shares = digg_json_object['count']
      puts '* digg done!'
    rescue
      puts '* digg failed :('
    end

    begin
      delicious_json_object = JSON.parse(open("http://feeds.delicious.com/v2/json/urlinfo/data?url=#{url}").read)
      article.delicious_shares = delicious_json_object[0]['total_posts']
      puts '* delicious done!'
    rescue Exception => e
      puts '* delicious failed :('
    end
    puts ''
    
    article.save if article.changed?
  end
end