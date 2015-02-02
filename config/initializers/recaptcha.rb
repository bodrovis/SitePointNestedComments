Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_KEY']
  config.private_key = ENV['RECAPTCHA_SECRET']
  config.api_version = 'v2'
end