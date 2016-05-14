class Language < ActiveRecord::Base
  has_many :diary_entries
end
