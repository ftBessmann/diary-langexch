class Correction < ActiveRecord::Base
  belongs_to :diary_entry
  belongs_to :profile
  has_many :comments, as: :commentable

  has_many :likes, as: :likeable
end
