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
    resources :gelandes, except: [:destroy] do
      collection { post :import }
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :reviews, only: [:index, :destroy]
    get 'home' => 'home#top'
  end
  
  resources :users, except: [:new]
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'autocomplete'
    end
  end
  resources :gelandes, only: [:index, :show] do
    resources :reviews, only: [:create, :index, :destroy]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
  resources :notifications, only: [:index] do
    collection do
      delete 'destroy_all', to: 'notifications#destroy_all'
    end
  end
  resources :schedules, except: [:index]

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get 'users/following/:user_id', to: 'users#following', as: 'users_following'
  get 'users/follower/:user_id', to: 'users#follower', as: 'users_follower'
  get 'inquiry/index'
  post 'inquiry/confirm'
  post 'inquiry/thanks'

end
