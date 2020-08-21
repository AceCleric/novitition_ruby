Rails.application.routes.draw do
  root 'dashboard#index'

  resources :wallets
  
  resources :games do
    resources :predictions
  end

  resources :users do
    resources :predictions
  end

  resources :competitions do
    resources :games
    resources :teams
  end
  
  resources :sports
  resources :users
  get 'profile/:id', to: 'users#show', as: 'profile'
  patch 'profile/:id', to: 'users#update'
  get 'sync_predictions', to: 'predictions#sync_predictions'
  get 'mock_game_result', to: 'games#mock_game_result'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
