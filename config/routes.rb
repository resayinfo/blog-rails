Rails.application.routes.draw do

  devise_for :users

  resources :admins
  
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
