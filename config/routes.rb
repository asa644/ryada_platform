Rails.application.routes.draw do
   # resources :lessons
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # resources :listings do
  #   put "approve", to: "listings#approve"
  #   put "disapprove", to: "listings#disapprove"
  #   resources :reviews, only: [:create] do
  #     resources :responds, only: [:create]
  #   end
  #   resources :lessons
  # end
  # resources :bookings, only: [:create, :show]
  # resources :categories
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # root to: 'landings#home'
  root to: 'subscribers#home'
  get '/urbanfitt' => 'subscribers#urban'
  scope '/urbanfitt' do
    get '/community' => 'subscribers#community'
    get '/events' => 'subscribers#events'
    get '/about' => 'subscribers#about'
    get '/attend' => 'subscribers#attend'
    resources :attendees, only: [:new, :create, :show]
  end
  resources :subscribers, only: [:create, :show]
  resources :feedbacks, only: [:new, :create, :show, :index]

  # get '/search' => 'listings#search'
  # get '/pendings' => 'listings#pendings'
  # get '/dashboard' => 'users#dashboard'
  # get '/profile' => 'users#profile'
  # get '/active' => 'users#active'
  # get '/pending' => 'users#pending'
  # get '/expired' => 'users#expired'
end
