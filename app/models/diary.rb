class Diary < ActiveRecord::Base
	# A diary belongs to a profile, but the database table diaries
	# has owner_id instead of profile_id
  belongs_to :owner, class_name: "Profile"
end
