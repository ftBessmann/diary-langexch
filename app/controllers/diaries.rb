get '/diaries' do
	@diaries = Diary.all

	erb :'diaries/index'
end

# Display diary entries for a specific diary
get '/diaries/:id/diary_entries' do
	@diary_entries = DiaryEntry.where(diary_id: params[:id])

	erb :'diary_entries/index'
end

get '/diaries/:id/diary_entries/new' do
	erb :'diary_entries/new'
end

# Display a specific diary entry from somebody's diary
get '/diaries/:diary_id/diary_entries/:id' do
	@diary_entry = DiaryEntry.find_by(id: params[:id])

	erb :'diary_entries/show'
end
