source 'https://rubygems.org'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

gem 'activesupport', '~>4.2.0'
gem 'activerecord', '~>4.2.0'

gem 'rake'

gem 'shotgun'

# For password encryption
gem 'bcrypt-ruby'

# For paginatination
# https://github.com/mislav/will_paginate
#gem 'will_paginate', '~> 3.1.0'
# https://github.com/bootstrap-ruby/will_paginate-bootstrap
gem 'will_paginate-bootstrap'

gem 'meetup_client'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec', '~>3.0'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
  gem 'faker-japanese'
end
