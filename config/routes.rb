Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :photo_infos, only: [:new, :create, :show]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get '/oauth/callback', to: 'o_auth#oauth_callback'
  get '/oauth_logout', to: 'o_auth#logout'
  get '/oauth_login', to: 'o_auth#login'

  get '/twitter', to: 'twitter#new'
  post '/twitter', to: 'twitter#create'
  resources :twitter
end
