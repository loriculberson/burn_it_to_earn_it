Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'home#index'
  # get  '/login'     => 'sessions#new'
  # post '/login'     => 'sessions#create'
  resources :users
  resources :health_profiles

end
