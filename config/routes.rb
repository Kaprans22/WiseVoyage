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
  end

  resources :user_trips, only: [:new, :create, :destroy]
  resources :trips, only: [:index, :show, :create, :destroy]

  delete '/trips', to: 'trips#destroy_all', as: 'destroy_all_trips'
  patch 'trips/:id/cancel_suggestion', to: 'trips#cancel_suggestion', as: 'cancel_suggestion_trip'
  post 'token', to: 'trips#refresh_access_token'

  get 'map', to: 'map#index'
  resources :suggestions, only: [ :index, :show ]

  resources :users, only: [:show, :edit, :update, :create, :new] do
    get 'dashboard', on: :member
  end


  get 'trips/:id/calculate_average', to: 'trips#calculate_average', as: 'calculate_average'

  resources :suggestions, only: [:index, :show]
end
