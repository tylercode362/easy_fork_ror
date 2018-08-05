Raven.configure do |config|
  config.dsn = Cfg["sentry"]["endpoint"]
end
