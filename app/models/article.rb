class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :body_html, :url, :description, :date_published, :source_id

  belongs_to :source

  validates_presence_of :title, :url

  scope :active, where(:active => true)
  scope :by_category, lambda{ |id| where(:category_id => id) }
end
