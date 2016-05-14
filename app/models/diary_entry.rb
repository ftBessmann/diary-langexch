class DiaryEntry < ActiveRecord::Base
  belongs_to :diary
  belongs_to :language

  def author
  	self.diary.profile
  end
end
