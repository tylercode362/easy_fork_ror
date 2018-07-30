require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BasicProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.app = config_for(:app)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    proxies = ["35.241.53.197"] # proxies 这个参数接受多种形式的参数，详见 http://api.rubyonrails.org/classes/ActionDispatch/RemoteIp.html

config.middleware.swap ActionDispatch::RemoteIp, ActionDispatch::RemoteIp, true, proxies
  end
end
