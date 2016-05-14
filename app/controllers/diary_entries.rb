get '/diary_entries' do
	@diary_entries = DiaryEntry.all

	erb :'diary_entries/index'
end
