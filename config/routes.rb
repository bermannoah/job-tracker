Rails.application.routes.draw do
  
  root to: "companies#index"

  resources :companies do
    resources :jobs
  end
  
  resources :categories
  resources :jobs
  resources :comments, only: [:create]
  resources :contacts, only: [:create]
  resources :dashboard, only: [:index]
  
end
