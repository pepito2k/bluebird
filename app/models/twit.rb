class Twit < ActiveRecord::Base
  attr_accessible :created_at, :twit_id, :text, :retweet_count, :favorited, :retweeted

  belongs_to :source
end
