Rails.application.routes.draw do
  resources :telephones
  resources :experiences
  resources :formations
  resources :profiles
  mount_devise_token_auth_for 'User', at: 'auth'
end
