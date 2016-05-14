get '/countries' do
	@countries = Country.all

	erb :'countries/index'
end
