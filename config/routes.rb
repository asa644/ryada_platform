Rails.application.routes.draw do
  # mount Spina::Engine => '/'
   resources :lessons
   mount RailsAdmin::Engine => '/admin_data', as: 'rails_admin'
  resources :listings do
    put "approve", to: "listings#approve"
    put "disapprove", to: "listings#disapprove"
    resources :reviews, only: [:create] do
      resources :responds, only: [:create]
    end
    resources :lessons
  end
  resources :bookings, only: [:create, :show]
  resources :categories
  devise_for :users, controllers: { confirmations: 'confirmations' }
  get '/about' => 'bookings#aboutus'
  root to: 'landings#home'
  get '/search' => 'listings#search'
  get '/pendings' => 'listings#pendings'
  get '/dashboard' => 'users#dashboard'
  get '/profile' => 'users#profile'
  get '/active' => 'users#active'
  get '/pending' => 'users#pending'
  get '/expired' => 'users#expired'
  # get '/:locale/*id' => 'pages#show', constraints: {locale: /#{Spina.config.locales.join('|')}/ }
  # get '/:locale/' => 'pages#homepage', constraints: {locale: /#{Spina.config.locales.join('|')}/ }
  # get '/*id' => 'pages#show', as: "page", controller: 'pages', constraints: lambda { |request|
  #   !(Rails.env.development? && request.env['PATH_INFO'].starts_with?('/rails/') || request.env['PATH_INFO'].starts_with?("/#{Spina.config.backend_path}") || request.env['PATH_INFO'].starts_with?('/attachments/'))
  # }
end
