class Admin::User < ActiveRecord::Base
  has_many :userresponses
  has_many :questioninstances, through: :userresponses
  
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates :username, :email, :password, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
