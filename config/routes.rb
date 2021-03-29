Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  get 'active_cases', to: 'pages#active_cases'
  
  resources :coordinators
  resources :workers
  resources :cases
end
