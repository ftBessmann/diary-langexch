# Lists all the users in the system
# Route not meant to be available to non-admin members
get '/users' do
	@users = User.all

	erb :'users/index'
end

# Same as get /users/new
get '/register' do
  # You cannot register if you are already logged in
  if logged_in?
    redirect '/'
  else
  	@user = User.new
    @profile = Profile.new
    @profile.native_language = NativeLanguage.new
    @profile.foreign_language = ForeignLanguage.new
    @countries = Country.all
    @languages = Language.all

  	erb :'users/new'
  end
end

# Same as post /users
post '/register' do
  # Create user account
  @user = User.new(params[:user])
  @countries = Country.all
  @languages = Language.all

  # Create profile and associate it with user account
  @profile = Profile.new(params[:profile])
  @user.profile = @profile

  # Create diary for the profile
  @user.profile.diary = Diary.new

  # Associate languages to the profile
  @profile.native_language = NativeLanguage.new(language_id: params[:native_language_id])
  @profile.foreign_language = ForeignLanguage.new(language_id: params[:foreign_language_id])
  @profile.birthday = Date.new(params[:profile_birthday_year].to_i, params[:profile_birthday_month].to_i, params[:profile_birthday_day].to_i)

  if @user.save && @profile.save
    login(@user)
    redirect "/"
  else
    @errors = @user.errors.full_messages + @profile.errors.full_messages

    # Remove the user that was saved
    @user.destroy

    erb :'/users/new'
  end
end

# Display a user account page
get '/users/:id' do
	@user = User.find_by(id: params[:id])
  if @user == current_user
	  erb :'users/show'
  else
    redirect "/"
  end
end

# Displays form to edit user account
get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  if @user == current_user
    erb :'users/edit'
  else
    redirect "/"
  end
end

# Updates user account
put '/users/:id' do
  @user = User.find_by(id: params[:id])
  if @user.password == params[:user][:password]
    @user.password = params[:user][:new_password]
    if @user.save
      redirect "/users/#{@user.id}"
    else
      erb :"users/edit"
    end
  else
    erb :"users/edit"
  end
end
