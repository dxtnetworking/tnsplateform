Rails.application.routes.draw do
  resources :habilites_extra_pros
  resources :centre_interets
  
  resources :reseau_socials
  resources :clubs
  resources :villes
  resources :pays
  
  resources :profiles, only: [:index, :show, :update] do
    resources :telephones, only: [:create, :update, :destroy]
    resources :experiences, only: [:create, :update, :destroy]
    resources :formations, only: [:create, :update, :destroy]
    resources :profile_socials, only: [:create, :update, :destroy]
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
