config.action_mailer.delivery_method = :mailgun
config.action_mailer.mailgun_settings = {
  api_key: Rails.application.config.app["mailergun_key"],
  domain: Rails.application.config.app["domain"],
}