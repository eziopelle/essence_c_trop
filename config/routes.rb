Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cars do
    resources :bookings, only: [:new, :create, :destroy]
    resources :reviews, only: [:index, :show, :new, :create, :destroy]
  end

  get "dashboard", to: "dashboard#show"
  get "dashboard/accept", to: "dashboard#accept"
  get "dashboard/decline", to: "dashboard#decline"
end
