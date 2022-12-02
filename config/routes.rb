Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :spaceships do
    resources :bookings, only: :create
  end

  resources :bookings, only: :index
  # Defines the root path route ("/")
  # root "articles#index"
  resources :my_spaceships, only: :index
end

#GET /spaceship/23

#POST /spaceship/23/bookings
