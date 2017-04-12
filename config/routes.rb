Rails.application.routes.draw do
  resources :trains do
    resources :carriages, only: [:new, :create]
  end
  resources :railway_stations
  resources :routes
end
