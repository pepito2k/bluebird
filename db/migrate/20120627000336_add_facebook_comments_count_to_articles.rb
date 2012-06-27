class AddFacebookCommentsCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :facebook_comments, :integer, :default => 0
  end
end
