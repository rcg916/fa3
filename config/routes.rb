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
  get '/reviews', to: 'reviews#index'
  get '/pics', to: 'photos#index'
  get '/faq', to: 'reviews#faq'
end
