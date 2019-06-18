Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.recaptcha[:access_key_id]
  config.secret_key = Rails.application.credentials.recaptcha[:secret_access_key]
end
