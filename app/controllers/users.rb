get '/users' do
	@users = User.all

	erb :'users/index'
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])

	erb :'users/show'	
end