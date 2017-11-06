Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings do
    resources :reviews, only: [:create] do
      resources :responds, only: [:create]
    end
    resources :lessons
  end
  resources :bookings, only: [:create, :show]
  resources :categories
  devise_for :users
  root to: 'landings#home'
  get '/search' => 'listings#search'
  get '/dashboard' => 'users#dashboard'
  get '/profile' => 'users#profile'
end
