Rails.application.routes.draw do
  devise_for :users
  resources :friends
  resources :home
  resources :users
  root 'home#index'
  get 'home/about'
  get '/search' => 'friends#index', as: :search_autocomplete
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
