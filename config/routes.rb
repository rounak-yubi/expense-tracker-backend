Rails.application.routes.draw do
  namespace :api do
    resources :employees, only: [:create]
    resources :expenses, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
