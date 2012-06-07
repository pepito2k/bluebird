class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :active, :password_confirmation, :remember_me

  validates :password, presence: true, confirmation: true, if: :needs_to_validates_password?
  validates_presence_of :first_name, :last_name, :email

  private
  def needs_to_validates_password?
    encrypted_password_changed? || new_record?
  end

end
