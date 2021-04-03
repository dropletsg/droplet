Rails.application.routes.draw do
  root to: 'pages#home'
  get 'active_cases', to: 'pages#active_cases'

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
    end
  end

  resources :payments, only: [:new, :show, :create] do
    member do
      get 'success'
    end
  end
end
