Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :jobs
  resources :job_responses
  resources :profiles, only: [:index,:show, :edit, :update]
  resources :chatrooms, only: [:show, :new, :create] do
    resources :messages, only: :create
  end
  get "dashboard", to: "pages#dashboard"
  resources :private_chatrooms, only: [:show, :new, :create] do
    resources :private_messages, only: [:create, :destroy]
  end

  resources :jobs do
    resources :job_responses, only: [:new, :create]
  end
  resources :job_responses, only: [:show, :new, :update, :destroy]

  resources :tags
  resources :blogs do
    resources :blog_posts do
      resources :comments
      resources :votes
    end
  end

  resources :categories, only: [:index, :show]

  get "new_messages", to: "private_messages#new_messages"
  get "read_messages", to: "private_messages#read_messages"
  post "read_messages", to: "private_messages#read_messages"

  resources :jobs, only: [:index, :show] do
    member do
      post 'toggle_favorite', to: "jobs#toggle_favorite"
    end
  end
  # Define your job_responses routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
