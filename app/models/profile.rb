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

  validates :name, presence: true
  validates :gender, presence: true
  validates :country, presence: true

  validates_presence_of :diary

  # This doesn't work?
  validates_presence_of :native_language
  validates_presence_of :foreign_language
  validates :native_language, presence: true
  validates :foreign_language, presence: true

  def set_avatar_url
    self.avatar_url ||= "/images/default_avatar.jpg"
  end
end
