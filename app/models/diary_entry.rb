class DiaryEntry < ActiveRecord::Base
  include HTMLDiff

  belongs_to :diary
  belongs_to :language
  has_many :comments, as: :commentable
  has_many :corrections

  has_many :likes, as: :likeable

  def author
  	self.diary.profile
  end

  # Set default entries per page (for pagination)
  #self.per_page = 10

  def compare_with(correction)
    self.diff(self.content, correction.content)
  end
end
