# Same as get /sessions/new
get '/login' do
  erb :'sessions/new'
end

post '/login' do
  user = User.authenticate(params[:user][:email], params[:user][:password])
  if user
    login(user)
    redirect "/profiles/#{user.profile.id}"
  else
    @errors = ["Invalid username or password"]
    erb :"/sessions/new"
  end
end

delete '/logout' do
  logout!
  redirect "/"
end
