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
    #ignore cdn ip to get client real_ip
    config.middleware.swap ActionDispatch::RemoteIp, ActionDispatch::RemoteIp, true, config.app["CDN_IPS"]
    config.autoload_paths+= Dir[Rails.root.join('app', 'workers', '*')]
    config.i18n.default_locale = :'zh-TW'
    config.active_job.queue_adapter = :sidekiq
  end
end
