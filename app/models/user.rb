class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates_uniqueness_of :email, :case_sensitive => false

  before_create :lower_case

  def lower_case
    self.email = self.email.strip.downcase
  end

  def self.authenticate_with_credentials email, password
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
