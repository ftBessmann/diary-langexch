class Profile < ActiveRecord::Base
  belongs_to :user

  # This could be extended to many diaries
  has_one :diaries
  belongs_to :country
end
