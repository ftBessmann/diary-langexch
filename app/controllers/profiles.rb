get '/profiles' do
	#@profiles = Profile.all
	@profiles = Profile.paginate(page: params[:page], per_page: 10)

	erb :'profiles/index'
end

get '/profiles/:id' do
	@profile = Profile.find_by(id: params[:id])

	erb :'profiles/show'	
end
