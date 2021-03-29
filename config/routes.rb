Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :coordinators

  resources :workers do
    resource :worker_notes
  end

  resources :cases do
    resource :case_notes
  end
end
