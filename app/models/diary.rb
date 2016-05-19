class Diary < ActiveRecord::Base
  belongs_to :profile

  has_many :diary_entries
end
