Sidekiq.configure_server do |config|
  config.redis = { url: Cfg['redis']['url'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Cfg['redis']['url'] }
end

