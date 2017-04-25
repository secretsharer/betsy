<<<<<<< HEAD
Rails.application.config.middleware.user OmniAuth::Builder do
=======
Rails.application.config.middleware.use OmniAuth::Builder do
>>>>>>> jsss/session_work
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "user:email"
end
