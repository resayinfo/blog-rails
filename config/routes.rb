Rails.application.routes.draw do

  get 'colors/index'

  get 'rgba/index'

  devise_for :users

  namespace :api do
    resources :articles, only: [:index, :create, :destroy, :update, :show] do
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

  resources :colors

  root 'welcome#index'
end
