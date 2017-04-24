Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: [:new, :create]
    resources :tickets, only: [:new, :create]
  end

  resources :tickets, only: [:index]

  resources :railway_stations do
    member do
      patch :update_position
      patch :update_time
    end
  end

  resources :routes
  resources :carriages, only: [:show]

  root 'searches#show'

  resource :search, only: [:show, :new, :edit] do
    post '/', to: 'searches#search'
  end
end
