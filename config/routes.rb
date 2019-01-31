Rails.application.routes.draw do
  devise_for :users
  root 'reviews#home'
  resources :stores do
  	resources :reviews do
  		resources :labelinfos, only: :create
  	end
  end
  resources :users, only: :show
  get '/reviews', to: 'reviews#index'
end
