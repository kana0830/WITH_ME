Rails.application.routes.draw do

  root 'home#top'
  get 'about', to: 'home#about'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#new_guest'
  end
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  namespace :admins do
    resources :gelandes, except: [:destroy]
  end
  
  resources :users, except: [:new]
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :gelandes, only: [:index, :show] do
    resources :reviews, only: [:create, :index, :destroy]
  end

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get 'users/following/:user_id', to: 'users#following', as: 'users_following'
  get 'users/follower/:user_id', to: 'users#follower', as: 'users_follower'

end
