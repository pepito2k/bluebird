class Source < ActiveRecord::Base

  attr_accessible :name, :active, :category, :category_id

  belongs_to :category

  validates_presence_of :name

end
