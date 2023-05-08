Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#hello_world'

  resources :users do
    member do
      get :following, :followers
    end
    collection do
      get :admins
    end
  end
  resources :posts
  resources :admin
  get 'login', to:'sessions#new'
  post 'login', to: 'sessions#create'
  #to fix this!!
  delete 'logout', to: 'sessions#destroy'
  get 'make_admin', to: 'users#make_admin'
  post 'make admin', to: 'users#make_admin'
  #get 'users/:id/following',to: 'users#following'
  #get 'users/:id/followers',to: 'users#followers'
  #get 'create', to:'posts#create'
  #get 'users', to: 'users#index'
  #get 'users/new', to:'users#new'
  #get 'users/:id', to: 'users#show'
  #post 'users', to: 'users#create'
end