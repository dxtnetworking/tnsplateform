Rails.application.routes.draw do
  resources :profile_socials
  resources :reseau_socials
  resources :clubs
  resources :villes
  resources :pays
  resources :telephones
  resources :experiences
  resources :formations
  resources :profiles
  mount_devise_token_auth_for 'User', at: 'auth'
end
