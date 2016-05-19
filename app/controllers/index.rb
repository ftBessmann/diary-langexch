# Route that locks down the app and only allows users to see the
# login or register page if they are not logged in
before do
	# Allow user to see the login page or registration page
	pass if %w[login register].include? request.path_info.split('/')[1]

	# Enforce user login for all other pages
	ensure_login!
end

get '/' do
	redirect '/diary_entries'
end
