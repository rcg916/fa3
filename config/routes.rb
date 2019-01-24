Rails.application.routes.draw do
  devise_for :users
  root 'reviews#home'
  resources :stores do
  	resources :reviews
  end
  get '/reviews', to: 'reviews#index'
end
