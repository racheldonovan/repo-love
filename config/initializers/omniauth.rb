Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'd94ae96084d12e108c76', '47a98a82a75ab9f72e9409a287f7e863b4fceae0'
end