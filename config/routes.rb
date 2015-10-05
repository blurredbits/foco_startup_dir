Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :announcements, only: [:new, :create, :destroy]
    resources :companies, only: [:new, :create, :destroy]
    resources :offices, only: [:new, :create, :destroy]
    resources :people, only: [:new, :create, :destroy]
  end

  devise_for :users
  root "static#index"

  resources :companies, only: [:index, :show, :edit, :update]
  resources :people, only: [:index, :show, :edit, :update]
  resources :offices, only: [:index, :show, :edit, :update]
  resources :announcements, only: [:index, :show, :edit, :update] 
    
end
