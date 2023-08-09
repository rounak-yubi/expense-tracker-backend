Rails.application.routes.draw do
  namespace :api do
    resources :employees, only: [:create]
    resources :expenses, only: [:create]
    resources :expense_approvals, only: %i[create update]
    get 'expenses/:user_id', to: 'expenses#user_expenses'
    get 'expense_approvals/:expense_id', to: 'expense_approvals#get_expense_detail'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
