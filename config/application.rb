require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Accounts
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  
    # Include react state helpers through React.addons.update
    # And which will process our state object (or any other object 
    # we send to it) and apply the provided commands
    config.react.addons = true
  
  end
end
