Rails.application.routes.draw do

  root 'home#top'
  get 'about', to: 'home#about'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do
    resources :gelandes, except: [:destroy]
  end
  
  resources :users, except: [:new]
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :gelandes, only: [:index, :show]
  resources :reviews, only: [:create, :show, :destroy]

end
