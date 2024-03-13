Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get "test", to: "pages#test"
  get 'dashboard', to: 'pages#dashboard'

  # Defines the root path route ("/")
  # root "posts#index"
  resources :trips do
    delete 'delete_specific', on: :member
    get :cancel_suggestion, on: :member
  end

  resources :user_trips, only: [:new, :create, :destroy]
  resources :trips, only: [:index, :show, :create, :destroy]

  delete '/trips', to: 'trips#destroy_all', as: 'destroy_all_trips'


  post 'token', to: 'trips#refresh_access_token'

  get 'map', to: 'map#index'
  resources :suggestions, only: [ :index, :show ]

  resources :users, only: [:show, :edit, :update, :create, :new] do
    get 'dashboard', on: :member
  end

  post 'trips/:id/get_trip_flight_info', to: 'trips#get_trip_flight_info', as: 'get_trip_flight_info'
  get 'trips/:id/calculate_average', to: 'trips#calculate_average', as: 'calculate_average'
  get 'about', to: 'pages#about', as: 'about'
end
