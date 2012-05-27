class Source < ActiveRecord::Base

  attr_accessible :screen_name, :name, :active, :category, :category_id, :twitter_id, 
                  :location, :description, :url, :date_registration, :lang, :profile_image_url

  belongs_to :category

  validates_presence_of :screen_name

  before_save :get_twitter_profile


  def get_twitter_profile
    if twitter_id.nil?
      @TwitterUser = Twitter.user(screen_name)
      self.twitter_id        = @TwitterUser.id,
      self.name              = @TwitterUser.name,
      self.location          = @TwitterUser.location,
      self.description       = @TwitterUser.description,
      self.url               = @TwitterUser.url,
      self.date_registration = @TwitterUser.created_at,
      self.lang              = @TwitterUser.lang,
      self.profile_image_url = @TwitterUser.profile_image_url
    end
  end

end
