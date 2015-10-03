Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  root "static#index"

  resources :companies
  resources :people
  resources :offices
  resources :announcements
    
end
