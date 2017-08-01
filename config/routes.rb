Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings
  devise_for :users
  root to: 'pages#home'
  get '/search' => 'listings#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
