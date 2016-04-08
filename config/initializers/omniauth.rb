Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV["client_id"], ENV["client_secret"]
end
