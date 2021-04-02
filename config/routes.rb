Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  get 'active_cases', to: 'pages#active_cases'
  
  resources :coordinators

  resources :workers do
    resource :worker_notes
  end

  resources :cases do
    resource :case_notes
    member do 
      patch 'shortlist'
    end
  end
end
