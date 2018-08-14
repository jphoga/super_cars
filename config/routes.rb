Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :new, :create, :show, :destroy] do
    resources :reviews, only: [:index, :new, :create, :show]
    resources :bookings, only: [:create]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:index, :destroy, :show]
end
