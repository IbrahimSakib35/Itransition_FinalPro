Rails.application.routes.draw do
  get 'tags/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    get 'block_user/:id', to: 'users#block_user', as: :block_user
    get 'unblock_user/:id', to: 'users#unblock_user', as: :unblock_user
    get 'add_admin/:id', to: 'users#add_admin', as: :add_admin
    get 'remove_admin/:id', to: 'users#remove_admin', as: :remove_admin
    get 'delete_user/:id', to: 'users#delete_user', as: :delete_user
    get 'user_management', to: 'users#user_management', as: :user_management
  end
  get 'blocked', to: 'pages#blocked'
  resources :collections do
    resources :items
  end
  resources :items, only: [:new, :create]
  resources :items, only: [:index, :show]
  resources :tags, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check

end