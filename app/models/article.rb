class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :body_html, :url, :description, :date_published, :source_id

  validates_presence_of :title, :url

  belongs_to :source
end
