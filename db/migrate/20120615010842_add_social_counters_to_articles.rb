class AddSocialCountersToArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :twitter_shares, :integer, :default => 0
  	change_column :articles, :facebook_shares, :integer, :default => 0
  	change_column :articles, :google_plus_shares, :integer, :default => 0
  	add_column :articles, :facebook_likes, :integer, :default => 0
  	add_column :articles, :digg_shares, :integer, :default => 0
  	add_column :articles, :delicious_shares, :integer, :default => 0
  	add_column :articles, :weight, :integer, :default => 0
  end
end
