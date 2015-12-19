Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :top, only: :index do
    collection do
      get 'newest'
    end
  end

  namespace :api do
    resource 'like', only: [:create, :destroy]
  end

  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :tags, param: :tag_name, only: [:index, :show]
end
