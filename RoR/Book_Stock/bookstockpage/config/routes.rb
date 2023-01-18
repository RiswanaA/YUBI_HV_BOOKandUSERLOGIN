Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "login#index"
  
  resources :book
  resources :search
  resources :author
  resources :login
  resources :bookuser
end
