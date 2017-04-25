<<<<<<< HEAD
<<<<<<< HEAD
Rails.application.config.middleware.user OmniAuth::Builder do
=======
Rails.application.config.middleware.use OmniAuth::Builder do
>>>>>>> jsss/session_work
=======
Rails.application.config.middleware.use OmniAuth::Builder do
>>>>>>> 726c4faf47c7b73b7ea5559e734ffb985c9f4a84
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "user:email"
end
