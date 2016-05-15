class DiaryEntry < ActiveRecord::Base
  belongs_to :diary
  belongs_to :language
  has_many :comments, as: :commentable
  has_many :corrections

  def author
  	self.diary.profile
  end

  # Set default entries per page (for pagination)
  #self.per_page = 10
end
