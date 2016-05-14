class DiaryEntry < ActiveRecord::Base
  belongs_to :diary
  belongs_to :language
  has many :comments, as: :commentable
  has many :corrections

  def author
  	self.diary.profile
  end
end
