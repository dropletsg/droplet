Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  
  resources :coordinators
  

=======

  resources :workers
>>>>>>> 4e20116c7c229ef722b42b31929bf343390ce372
end
