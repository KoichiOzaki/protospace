Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'top#index'

  resources :top, only: :index do
    collection do
      get 'newest'
    end
  end

  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
    member do
      post 'likes' => 'likes#create'
      delete 'likes' => 'likes#destroy'
    end
  end

  resources :users, only: [:show, :edit, :update]
end
