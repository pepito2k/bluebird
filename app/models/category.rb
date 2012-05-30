class Category < ActiveRecord::Base
  attr_accessible :name, :active

  has_many :sources
  has_many :articles, :through => :sources

  validates_presence_of :name

  scope :active, where(:active => true)
end