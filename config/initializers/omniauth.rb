Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :persona
  provider :developer if Rails.env.test?
end