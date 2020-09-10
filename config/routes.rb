Rails.application.routes.draw do

  root 'posts#index'
  resources :friendships, only: %i[create update]
  devise_for :users
  get 'users/notifications'
  resources :friendships, only: %i[create update]
  resources :users, only: [:index, :show, :notifications]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
