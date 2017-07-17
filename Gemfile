source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.1.6'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'activesupport', '>= 3.1'
gem 'bcrypt'
gem 'sass'
gem 'haml'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'

gem 'carrierwave', :require => ['carrierwave', 'carrierwave/orm/activerecord']

# Test requirements

# Padrino Stable Gem
gem 'padrino', '0.13.3.2'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.3.2'
# end

group :development do
  gem 'capistrano-passenger'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
end