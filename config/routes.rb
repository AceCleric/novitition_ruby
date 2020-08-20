Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root 'dashboard#index'

  resources :wallets
  
  resources :games do
    resources :predictions
  end

  resources :user do
    resources :predictions
  end

  resources :teams
  resources :competitions
  resources :sports
  resources :users
  get 'profile/:id', to: 'users#show', as: 'profile'
  patch 'profile/:id', to: 'user#update'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
