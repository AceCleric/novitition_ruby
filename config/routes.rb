Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root 'users#index'

  resources :wallets
  resources :predictions
  resources :games
  resources :teams
  resources :competitions
  resources :sports
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
