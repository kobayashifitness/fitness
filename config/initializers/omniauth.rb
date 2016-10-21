# ”FØ
Rails.application.config.middleware.use OmniAuth::Builder do
 
  # twitter
  provider :twitter, Rails.application.secrets.twitter_consumer_key, Rails.application.secrets.twitter_consumer_secret
end
 
# ƒLƒƒƒ“ƒZƒ‹
OmniAuth.config.on_failure = Proc.new do |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end
