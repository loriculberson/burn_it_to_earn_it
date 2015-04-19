Rails.application.routes.draw do
  root 'home#index'
  get  '/login'     => 'sessions#new'

end
