desc "Get last twits from Sources"
task :get_twits => :environment do
  sources = Source.all
  sources.each do |s|
    timeline = Twitter.user_timeline(s.screen_name)
    timeline.each do |t|
      s.twits.create({
        :created_at    => t.created_at,
        :twit_id       => t.id,
        :text          => t.text,
        :retweet_count => t.retweet_count,
        :favorited     => t.favorited,
        :retweeted     => t.retweeted
      })
    end
  end
end