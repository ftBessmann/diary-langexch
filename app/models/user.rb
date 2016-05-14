require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

	# This could be extended to many profiles
  has_one :profile

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
end
