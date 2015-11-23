Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'top#index'

  resources :top, only: :index
  resources :prototypes, except: [:index]
  resources :users, only: [:show, :edit, :update]
end
