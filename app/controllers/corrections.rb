# Create a new correction for a diary entry
post '/diary_entries/:id/corrections' do
  @correction = Correction.new(params[:correction])
  @correction.profile = current_user.profile
  @correction.diary_entry = DiaryEntry.find_by(id: params[:id])

  # Highlights the changes from the original to the corrected entry using HTMLDiff
  @correction.content = @correction.diary_entry.compare_with(@correction)

  if @correction.save
    erb :'corrections/show',
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
