Rails.application.routes.draw do

  devise_for :users

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
