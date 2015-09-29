Rails.application.routes.draw do
  devise_for :users
  root "static#index"

  resources :companies
  resources :people
  resources :offices
  resources :announcements
    
end
