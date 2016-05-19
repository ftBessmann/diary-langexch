# Lists all the profiles in the system
get '/profiles' do
	#@profiles = Profile.all
	@profiles = Profile.paginate(page: params[:page], per_page: 10)

	erb :'profiles/index'
end

# Display a specific profile
get '/profiles/:id' do
	@profile = Profile.find_by(id: params[:id])

	erb :'profiles/show'
end

# Form to edit a profile
get '/profiles/:id/edit' do
  @profile = Profile.find(params[:id])
  @countries = Country.all
  @languages = Language.all

  # Authorization check
  if current_user.profile == @profile
    erb :'profiles/edit'
  else
    # You cannot edit a profile that is not your own
    redirect "/profiles/#{@profile.id}"
  end
end

# Route to update profile information
put '/profiles/:id' do
  @profile = Profile.find(params[:id])
  @profile.update_attributes(params[:profile])
  @profile.native_language.language_id = params[:native_language_id].to_i
  @profile.foreign_language.language_id = params[:foreign_language_id].to_i
  @profile.birthday = Date.new(params[:profile_birthday_year].to_i, params[:profile_birthday_month].to_i, params[:profile_birthday_day].to_i)

  if @profile.save && @profile.native_language.save && @profile.foreign_language.save
    redirect "/profiles/#{@profile.id}"
  else
    erb :"/profiles/edit"
  end
end
