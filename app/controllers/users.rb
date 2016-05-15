get '/users' do
	@users = User.all

	erb :'users/index'
end

# Same as get /users/new
get '/register' do
	@user = User.new

	erb :'users/new'
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])

	erb :'users/show'	
end