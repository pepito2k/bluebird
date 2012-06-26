class AddExtendedUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :url_extended, :string

    Article.all.each do |article|
    	url = URI.escape(Unshorten[article.url]).split('?').first
    	article.update_attribute(:url_extended, url)
    end
  end
end
