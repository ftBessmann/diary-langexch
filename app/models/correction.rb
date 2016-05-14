class Correction < ActiveRecord::Base
  belongs_to :diary_entry
  belongs_to :profile
  has many :comments, as: :commentable
end
