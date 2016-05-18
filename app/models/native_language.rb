class NativeLanguage < ActiveRecord::Base
  belongs_to :profile
  belongs_to :language

  validates :profile, presence: true
  validates :language, presence: true
end
