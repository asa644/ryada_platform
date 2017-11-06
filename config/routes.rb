Rails.application.routes.draw do
  mount Spina::Engine => '/'
   resources :lessons
   mount RailsAdmin::Engine => '/admin_data', as: 'rails_admin'
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
  get '/:locale/*id' => 'pages#show', constraints: {locale: /#{Spina.config.locales.join('|')}/ }
  get '/:locale/' => 'pages#homepage', constraints: {locale: /#{Spina.config.locales.join('|')}/ }
  get '/*id' => 'pages#show', as: "page", controller: 'pages', constraints: lambda { |request|
    !(Rails.env.development? && request.env['PATH_INFO'].starts_with?('/rails/') || request.env['PATH_INFO'].starts_with?("/#{Spina.config.backend_path}") || request.env['PATH_INFO'].starts_with?('/attachments/'))
  }
end
