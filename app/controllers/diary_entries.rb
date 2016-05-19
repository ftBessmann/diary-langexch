get '/diary_entries' do
	# List all entries paginated
	@diary_entries = DiaryEntry.paginate(page: params[:page], per_page: 10)

	erb :'diary_entries/index'
end

# Route to like/unlike a diary entry
post '/diary_entries/:id/like' do
	@diary_entry = DiaryEntry.find_by(id: params[:id])
	like = @diary_entry.likes.find { |like| like.profile == current_user.profile }

	if like
		like.destroy
	else
		Like.create(likeable: @diary_entry, profile: current_user.profile)
	end

	if request.xhr?
		content_type :json
		{ like_count: @diary_entry.likes.count }.to_json
	else
		redirect "#{params[:source]}"
	end
end
