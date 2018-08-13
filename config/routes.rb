Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :new, :create, :show, :destroy] do
    resources :reviews, only: [:index, :new, :create, :show]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:destroy]
end
