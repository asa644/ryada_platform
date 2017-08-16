source 'https://rubygems.org'
ruby '2.3.3'

gem 'devise'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem 'puma'
gem 'rails', '5.1.2'
gem 'redis'

gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'draper'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'uglifier'
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin'


# content management system
gem "camaleon_cms"


#search
gem 'algoliasearch-rails'
#testing
gem 'faker'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.0.5'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


#################### Camaleon CMS include all gems for plugins and themes ####################
require './lib/plugin_routes'
instance_eval(PluginRoutes.draw_gems)
