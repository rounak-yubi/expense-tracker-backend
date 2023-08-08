Rails.application.routes.draw do
  namespace :api do
    resources :employees, only: [:create]
    resources :expenses, only: [:create]
    resources :expense_approvals, only: [:create]
    get 'expenses/:user_id', to: 'expenses#index_by_user', as: :expenses_by_user
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
