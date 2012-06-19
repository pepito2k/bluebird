class Article < ActiveRecord::Base
  attr_accessible :title, :author, :body, :body_html, :url, :description, :date_published, :source_id, :twit_id, :image_url

  belongs_to :source

  validates_presence_of :title, :url

  scope :active, where(:active => true)
end
