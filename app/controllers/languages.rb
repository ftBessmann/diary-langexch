get '/languages' do
	@languages = Language.all

	erb :'languages/index'
end

# List entries written in specific language
get '/languages/:id' do
	@language = Language.find_by(id: params[:id])

	erb :'languages/show'
end
