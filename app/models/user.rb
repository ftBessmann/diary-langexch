require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

	# This could be extended to many profiles
  has_one :profile

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  # doesn't work: 
  #validates :password, length: { minimum: 6, message: 'password length' }
  validates :password, presence: true

  # Disabled because affects the seeding
  # (when you try to create a user without a profile, it fails to create user)
  #validates_presence_of :profile

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.password == password ? user : nil
  end

end
