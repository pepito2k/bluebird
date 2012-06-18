class Category < ActiveRecord::Base
  attr_accessible :name, :active

  has_many :sources
  has_many :articles, through: :sources
  has_attached_file :cover, styles: { full: "716x1024>", thumb: "179x256>" }

  validates_presence_of :name

  scope :active, where(:active => true)

  before_save :add_slug

  private
  def add_slug
    self.slug = name.parameterize
  end
end