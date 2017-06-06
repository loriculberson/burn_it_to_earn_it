Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'home#index'

  resource :user
  resource :health_profile
  resources :exercises, only: [:index]
  resources :foods
  # resources :food_searches 
  resources :workouts, only: [:create, :destroy]
  resources :pending_workouts, only: [:create]
end
