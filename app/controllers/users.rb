get '/users' do
	@users = User.all

	erb :'users/index'
end

# Same as get /users/new
get '/register' do
	@user = User.new
  @countries = Country.all
  @languages = Language.all
	erb :'users/new'
end

post '/register' do
  @user = User.new(params[:user])
  @profile = Profile.new(params[:profile])
  @profile.native_language = NativeLanguage.new(language_id: params[:native_language_id])
  @profile.foreign_language = ForeignLanguage.new(language_id: params[:foreign_language_id])
  if @user.save
    login(@user)
    redirect "/"
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])

	erb :'users/show'
end
