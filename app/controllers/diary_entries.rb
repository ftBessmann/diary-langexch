get '/diary_entries' do
	# List all entries paginated
	@diary_entries = DiaryEntry.paginate(page: params[:page], per_page: 10)

	erb :'diary_entries/index'
end


post '/diary_entries/:id/corrections' do
	@correction = Correction.new(params[:correction])
	@correction.profile = current_user.profile
	@correction.diary_entry = DiaryEntry.find_by(id: params[:id])

	if @correction.save
		erb :'diary_entries/_entry', 
				layout: !request.xhr?, 
				locals: { correction: @correction }
	else
		# failed to save correction
		# send error?
		status 422

		if request.xhr?
			{ success: false, error: @correction.errors.full_messages }.to_json
		else
			erb :"diaries/#{correction.diary_id}/diary_entries/#{correction.diary_entry.id}"
		end
	end
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
	redirect "#{params[:source]}"
end
