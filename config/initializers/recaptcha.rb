Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTHCA_KEY']
  config.private_key = ENV['RECAPTHCA_SECRET']
  config.api_version = 'v2'
end