source :rubygems

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'

gem 'activesupport'
gem 'activerecord'

gem 'rake'

gem 'shotgun'

if Sinatra::Application.development?
  group :test do
    gem 'faker'
    gem 'rspec'
  end
end 