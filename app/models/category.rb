class Category < ActiveRecord::Base
  attr_accessible :name, :active

  validates_presence_of :name
end