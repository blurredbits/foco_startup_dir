Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :announcements, only: [:new, :create, :destroy]
  end

  devise_for :users
  root "static#index"

  resources :companies
  resources :people
  resources :offices
  resources :announcements, only: [:index, :show, :edit, :update] 
    
end
