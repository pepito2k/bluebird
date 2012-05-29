class Source < ActiveRecord::Base

  attr_accessible :screen_name, :name, :active, :category, :category_id, :twitter_id, 
                  :location, :description, :url, :date_registration, :lang, :profile_image_url

  belongs_to :category
  has_many :twits

  validates_presence_of :screen_name
  validates_presence_of :category

  before_save :get_twitter_profile

  private
  def get_twitter_profile
    unless screen_name_changed? && twitter_id
      user = Twitter.user(self.screen_name)

      self.attributes = {
        twitter_id:        user.id,
        name:              user.name,
        location:          user.location,
        description:       user.description,
        url:               user.url,
        date_registration: user.created_at,
        lang:              user.lang,
        profile_image_url: user.profile_image_url
      }
    end
  end

end
