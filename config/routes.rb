Rails.application.routes.draw do

  devise_for :users
  resources :users do
    get 'search', on: :collection
  end

  namespace :api do

    # API Devise routes
      post 'users', to: 'registrations#create'
      patch 'users', to: 'registrations#update'
      post 'users/sign_in', to: 'sessions#create'
      post 'users/password', to: 'passwords#create'

    resources :users

    resources :articles do
        resources :comments, only: [:create]
        put :reorder, on: :collection
    end

    resources :comments, only: [:update, :destroy] do
      put :reorder, on: :collection
    end
  end

  resources :articles do
    resources :comments
    get 'search', on: :collection
  end

  resources :admins do
    get 'search', on: :collection
  end

  resources :superadmins do
    get 'search', on: :collection
  end

  root 'welcome#index'
end
