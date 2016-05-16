get '/diaries' do
	@diaries = Diary.all

	erb :'diaries/index'
end

# Display diary entries for a specific diary
get '/diaries/:id/diary_entries' do
	@diary_entries = DiaryEntry.where(diary_id: params[:id]).paginate(page: params[:page], per_page: 10)

	erb :'diary_entries/index'
end

# form to create new entry
get '/diaries/:id/diary_entries/new' do
  @languages = Language.all

	erb :'diary_entries/new'
end

post '/diaries/:id/diary_entries' do
  p "hit post route"
  @diary_entry = DiaryEntry.new(params[:diary_entry])
  @diary_entry.content = sanitize_html(@diary_entry.content)
  @diary_entry.content = simple_format(@diary_entry.content)
  @diary_entry.diary_id = params[:id]
  if @diary_entry.save
    p "saved"
    redirect "/diaries/#{@diary_entry.diary_id}/diary_entries"
  else
    p "not saved"
    erb :'diary_entries/new'
  end
end

# Display a specific diary entry from somebody's diary
get '/diaries/:diary_id/diary_entries/:id' do
	@diary_entry = DiaryEntry.find_by(id: params[:id])

	erb :'diary_entries/show'
end
