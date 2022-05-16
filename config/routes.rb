Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :vehicles, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
end
