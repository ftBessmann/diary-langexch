class Profile < ActiveRecord::Base
  belongs_to :user

  # This could be extended to many diaries
  has_one :diary
  belongs_to :country
end
