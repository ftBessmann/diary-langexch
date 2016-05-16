get '/diary_entries' do
	# List all entries paginated
	@diary_entries = DiaryEntry.paginate(page: params[:page], per_page: 10)

	erb :'diary_entries/index'
end


