Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings do
    resources :reviews
  end
  resources :categories

  devise_for :users
  root to: 'pages#home'
  get '/search' => 'listings#search'

end
