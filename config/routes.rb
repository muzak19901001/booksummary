Rails.application.routes.draw do
  
  root to: 'toppages#index'
  resources :toppages, only: [:show, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :create, :new]
  resources :articles, only: [:new, :show, :create, :edit, :update, :destroy ] 
end
