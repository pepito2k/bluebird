class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :body_html, :url, :description, :date_published, :source_id

  belongs_to :source
end
