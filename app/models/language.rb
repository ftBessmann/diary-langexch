class Language < ActiveRecord::Base
  has_many :diary_entries

  def native_speakers
    Profile.all.select do |profile|
    	unless profile.native_language.nil?
    		profile.native_language.language == self
    	else
    		false
    	end
    end
  end
end
