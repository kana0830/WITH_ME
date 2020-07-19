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

  namespace :admin do
    resources :gelandes, except: [:destroy]
  end
  
  resources :users, except: [:new]
  get 'exit' => 'customers#exit'

end
