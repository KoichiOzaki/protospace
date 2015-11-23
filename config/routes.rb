Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'top#index'
  post 'like/:prototype_id' => 'likes#create', as: 'like'
  delete 'like/:prototype_id' => 'likes#destroy', as: 'destroy_like'

  resources :top, only: :index
  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
