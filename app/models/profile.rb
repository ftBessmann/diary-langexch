class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :corrections
  has_many :comments
  # This could be extended to many diaries
  has_one :diary
  belongs_to :country
end
