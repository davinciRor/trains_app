Rails.application.routes.draw do
  devise_for :users

  resources :tickets, only: [:index]

  namespace :admin do
    resources :railway_stations do
      member do
        patch :update_position
        patch :update_time
      end
    end

    resources :trains do
      resources :carriages, only: [:new, :create]
      resources :tickets, only: [:new, :create]
    end

    resources :routes
    resources :carriages, only: [:show]
  end

  root 'searches#show'

  resource :search, only: [:show, :new, :edit] do
    post '/', to: 'searches#search'
  end
end
