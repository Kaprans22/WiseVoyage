Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
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
  post 'token', to: 'trips#refresh_access_token'
  get 'map', to: 'map#index'
  resources :suggestions, only: [ :index, :show ]

  resources :users, only: [:show, :edit, :update, :create, :new] do
    get 'dashboard', on: :member
  end

end
