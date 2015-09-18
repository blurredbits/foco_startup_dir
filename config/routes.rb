Rails.application.routes.draw do
  root "companies#index"

  resources :companies
  resources :people
  resources :offices
  resources :announcements
    
end
