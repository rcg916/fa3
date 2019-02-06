Rails.application.routes.draw do
  get 'photoupvotes/update'
  get 'favoritestores/update'
  devise_for :users
  root 'reviews#home'
  resources :stores do
  	resources :reviews do
  		resources :labelinfos, only: :create
      resources :photos, only: [:create, :show]
  	end
  end
  resources :users, only: :show do
  	resources :userlocations, only: :create
  end
  namespace :admin do
    resources :dashboard, only: :index
  end
  get '/reviews', to: 'reviews#index'
  get '/pics', to: 'photos#index'
  get '/faq', to: 'reviews#faq'
  get '/admin', to: 'admin/dashboard#index'
  get '/admin/users', to: 'admin/dashboard#users'
  get '/admin/stores', to: 'admin/dashboard#stores'
  get '/admin/reviews', to: 'admin/dashboard#reviews'
end
