Rails.application.routes.draw do
  root 'reviews#home'
  resources :stores do
  	resources :reviews
  end
  get '/reviews', to: 'reviews#index'
end
