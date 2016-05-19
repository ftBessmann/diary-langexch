# Create a new comment for a diary entry
post '/diary_entries/:id/comments' do
  @comment = Comment.new(params[:comment])
  @comment.profile = current_user.profile
  @comment.commentable = DiaryEntry.find_by(id: params[:id])


  if @comment.save
      redirect "/diaries/#{@comment.commentable.diary.id}/diary_entries/#{params[:id]}"
  #   erb :'diary_entries/_entry',
  #       layout: !request.xhr?,
  #       locals: { comment: @comment }
  # else
  #   # failed to save comment
  #   # send error?
  #   status 422

  #   if request.xhr?
  #     { success: false, error: @comment.errors.full_messages }.to_json
  #   else
  #     erb :"diaries/#{comment.diary_id}/diary_entries/#{comment.diary_entry.id}"
  #   end
  end
end

post '/corrections/:id/comments' do
  @comment = Comment.new(params[:comment])
  @comment.profile = current_user.profile
  @comment.commentable = Correction.find_by(id: params[:id])

  if @comment.save
      redirect "#{params[:source]}"
  #   erb :'diary_entries/_entry',
  #       layout: !request.xhr?,
  #       locals: { comment: @comment }
  # else
  #   # failed to save comment
  #   # send error?
  #   status 422

  #   if request.xhr?
  #     { success: false, error: @comment.errors.full_messages }.to_json
  #   else
  #     erb :"diaries/#{comment.diary_id}/diary_entries/#{comment.diary_entry.id}"
  #   end
  end
end
