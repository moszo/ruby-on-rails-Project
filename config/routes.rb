Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :todos
  resources :friends
  resources :users, only: [:new, :create]
  get 'todo/index'
  get 'home/about'
  root "home#index"
  #logowanie
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #rejestracja
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  #logout
  match '/logout', to: 'sessions#destroy', via: [:delete, :get]

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
