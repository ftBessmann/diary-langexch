class Profile < ActiveRecord::Base

  before_save :set_avatar_url

  belongs_to :user
  has_many :corrections
  has_many :comments
  # Later we can extend native/foreign languages to many
  has_one :native_language
  has_one :foreign_language
  # This could be extended to many diaries
  has_one :diary
  belongs_to :country

  has_many :likes

  validates :name, presence: true
  validates :gender, presence: true
  validates :country, presence: true

  # Disabled because affects the seeding
  # (when you try to create a profile without a diary, it fails to create profile
  #validates_presence_of :diary

  # This doesn't work? Also affects seeding (won't save profile)
  # There are issues when one model depends on another via associations...
  #validates_presence_of :native_language
  #validates_presence_of :foreign_language
  #validates :native_language, presence: true
  #validates :foreign_language, presence: true

  def set_avatar_url
    self.avatar_url ||= "/images/default_avatar.jpg"
  end

  def has_correction?(diary_entry)
    self.corrections.find { |correction| correction.diary_entry == diary_entry }
  end
end
