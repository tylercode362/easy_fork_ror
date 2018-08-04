config.action_mailer.delivery_method = :sendgrid_actionmailer
config.action_mailer.sendgrid_actionmailer_settings = {
  api_key: rails.application.config.app['SENDGRID_API_KEY']
}