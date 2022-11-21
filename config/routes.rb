Rails.application.routes.draw do

  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
