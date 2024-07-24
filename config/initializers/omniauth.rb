Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
      scope: 'email,profile',
      prompt: 'select_account',
      setup: true
    }
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], {
        scope: 'email,public_profile',
        info_fields: 'email,name',
        callback_path: '/users/auth/facebook/callback' # Ensure this is correct
    }
end