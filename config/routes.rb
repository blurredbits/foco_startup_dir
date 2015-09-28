Rails.application.routes.draw do
  root "static#index"

  resources :companies
  resources :people
  resources :offices
  resources :announcements
    
end
