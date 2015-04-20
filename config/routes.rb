Rails.application.routes.draw do
  root 'home#index'
  get  '/login'     => 'sessions#new'
  post '/login'     => 'sessions#create'

  resources :users
  resources :health_profiles

end
