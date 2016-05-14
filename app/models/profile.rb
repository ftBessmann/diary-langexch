class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :corrections
  has_many :comments
  # Later we can extend native/foreign languages to many
  has_one :native_language
  has_one :foreign_language
  # This could be extended to many diaries
  has_one :diary
  belongs_to :country
end
