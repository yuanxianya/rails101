Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post :join
      post :quit
    end

      resources :posts
    end
    namespace :account do
    resources :groups
    resources :posts
  end

  # For details on the DSL available within this
    root 'groups#index'
  end
