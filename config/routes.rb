Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get "test", to: "pages#test"

  get 'dashboard', to: 'pages#dashboard'

  resources :trips do
    delete 'delete_specific', on: :member
  end

  resources :trips, only: [:index, :show, :create, :destroy]

  delete '/trips', to: 'trips#destroy_all', as: 'destroy_all_trips'

  post 'token', to: 'trips#refresh_access_token'

  get 'map', to: 'map#index'

  get 'trips/:id/calculate_average', to: 'trips#calculate_average', as: 'calculate_average'

  resources :suggestions, only: [:index, :show]
end
