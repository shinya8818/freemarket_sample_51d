Recaptcha.configure do |config|
  config.site_key = ENV ["access_key_id"]
  config.secret_key = ENV ["secret_access_key"]
end
