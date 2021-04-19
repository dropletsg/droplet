Rails.application.routes.draw do
  root to: 'pages#home'
  get 'active_cases', to: 'pages#active_cases'
  get 'active_cases/:id', to: 'pages#active_cases_show'

  devise_for :users

  mount StripeEvent::Engine, at: '/stripe-webhooks'

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

  post 'selected_cases', to: 'cases#selected_cases'
  get 'cases_roundup_telegram', to: 'cases#cases_roundup_telegram'
  post 'cases_roundup_telegram', to: 'cases#cases_roundup_telegram'

  resources :payments, only: [:new, :show, :create] do
    member do
      get 'success'
    end
  end
  
  resources :case_contributors, only: [:new, :create]
end
