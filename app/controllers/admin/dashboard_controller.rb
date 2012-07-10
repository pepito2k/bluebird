class Admin::DashboardController < Admin::AdminController

  def index
    @tweets_processed = Twit.processed.count
    @tweets_total     = Twit.count
    @articles_created = Article.count
    @tweet_sources    = Source.count
    @categories       = Category.count
  end

end
