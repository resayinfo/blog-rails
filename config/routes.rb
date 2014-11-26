Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :comments
    get 'search', on: :collection
  end

  resources :admins

  resources :superadmins

  root 'welcome#index'
end
