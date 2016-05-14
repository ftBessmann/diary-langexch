class User < ActiveRecord::Base
	# This could be extended to many profiles
  has_one :profile
end
