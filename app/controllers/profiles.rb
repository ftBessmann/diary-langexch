get '/profiles' do
	@profiles = Profile.all

	erb :'profiles/index'
end

get '/profiles/:id' do
	@profile = Profile.find_by(id: params[:id])

	erb :'profiles/show'	
end
