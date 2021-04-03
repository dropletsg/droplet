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
      patch 'list'
      delete 'delete_attachment/:delete_attachment_id', to: "cases#delete_attachment", as: :delete_attachment
    end
  end
end
