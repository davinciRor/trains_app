Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  resources :tickets, only: [:index, :show]

  namespace :admin do
    resources :welcomes, only: [:index]

    resources :railway_stations do
      member do
        patch :update_position
        patch :update_time
      end
    end

    resources :trains do
      resources :carriages, only: [:new, :create]
    end

    resources :routes do
      patch :update_name
    end
    resources :carriages, only: [:show]
    resources :tickets, only: [:index, :show, :destroy]
  end

  root 'searches#show'

  resources :trains, only: [] do
    resources :tickets, only: [:new, :create]
  end

  resource :search, only: [:show, :new, :edit] do
    post '/', to: 'searches#search'
  end
end
