require_relative 'boot'

require "rails"
require 'carrierwave'
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RyadaPlatform
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "9eaf4e5c-6104-4d07-9fc0-6757e757437e" }
    config.action_mailer.default_url_options = { host: "ryadapp.herokuapp.com" }
    # config.time_zone = "Etc/GMT-3"
    config.generators do |generate|
      generate.assets false
      generate.helper false
    end
  # config.assets.paths << "#{Rails.root}/app/assets/information"


    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
