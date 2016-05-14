get '/diaries' do
	@diaries = Diary.all

	erb :'diaries/index'
end

# Display a specific diary entry from somebody's diary
get '/diaries/:diary_id/diary_entries/:id' do
	@diary_entry = DiaryEntry.find_by(id: params[:id])

	erb :'diary_entries/show'
end
