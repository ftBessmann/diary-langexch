class Correction < ActiveRecord::Base
  belongs_to :diary_entry
  belongs_to :profile
  has_many :comments, as: :commentable

  has_many :likes, as: :likeable

  # Prevents profile from creating more than one correction for the same diary entry
  validates :diary_entry_id, uniqueness: { scope: :profile_id,
            message: "You've already written a correction for this diary entry!" }
end
