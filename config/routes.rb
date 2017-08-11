Rails.application.routes.draw do
  resources :lessons
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings do
    resources :reviews, only: [:create] do
      resources :responds, only: [:create]
    end
    resources :lessons
  end
  resources :categories

  devise_for :users
  root to: 'pages#home'
  get '/search' => 'listings#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
