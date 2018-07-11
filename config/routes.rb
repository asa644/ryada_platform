Rails.application.routes.draw do
# match "*path" => redirect("https://www.localfitt.com/%{path}"), :constraints => { :protocol => "http://" }
# match "*path" => redirect("https://www.localfitt.com/%{path}"), :constraints => { :subdomain => "" }
   # resources :lessons
mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'landings#home'
  resources :listings do
    put "approve", to: "listings#approve"
    put "disapprove", to: "listings#disapprove"
    resources :reviews, only: [:create] do
      resources :responds, only: [:create]
    end
    resources :lessons
  end
    resources :lessons

  # get 'yogaforacause' => 'subscribers#yoga'
  resources :bookings, only: [:new,:create, :show]
  resources :categories
  resources :posts
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :subscribers, only: [:create, :show]
  resources :feedbacks, only: [:new, :create, :show, :index]
  get '/contact' => 'feedbacks#new'
  get '/workouts' => 'listings#index'

  # get '/search' => 'listings#search'
  # get '/pendings' => 'listings#pendings'
  # get '/dashboard' => 'users#dashboard'
  # get '/profile' => 'users#profile'
  get '/active' => 'users#active'
  get '/hi' => 'listings#hi'
  get '/urbanfitt' => 'subscribers#urban'
  scope '/urbanfitt' do
    get '/community' => 'subscribers#community'
    get '/events' => 'subscribers#events'
    get '/about' => 'subscribers#about'
    get '/attend' => 'subscribers#attend'
    resources :attendees, only: [:new, :create, :show]
  end
  get '/notice' => 'landings#notice'
  get '/yogaforacause' => 'landings#yoga'

  get '*path' => redirect('/')

  # get '/pending' => 'users#pending'
  # get '/expired' => 'users#expired'
end
