Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :jobs
  resources :job_responses
  resources :profiles, only: [:show, :edit, :update]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  get "dashboard", to: "pages#dashboard"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
