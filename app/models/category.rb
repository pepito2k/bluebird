class Category < ActiveRecord::Base
  attr_accessible :name, :active

  has_many :sources

  validates_presence_of :name
end