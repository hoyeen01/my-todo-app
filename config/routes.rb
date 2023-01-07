Rails.application.routes.draw do
  resources :todo_lists 

  scope :auth do 
    get 'sign-in', to: 'auth#sign_in', as: :sign_in
    post 'sign-in', to: 'auth#login', as: :login
    get 'sign-up', to: 'auth#sign_up', as: :sign_up
    post 'sign-up', to: 'auth#create_user', as: :create_user
    get 'logout', to: 'auth#logout', as: :logout
  end

  namespace :api do
    get 'test', to: 'test#index', as: :test
    post 'users', to: 'auth#register', as: :register
    post 'sign-in', to: 'auth#sign_in', as: :sign_in

    resources :todo_lists,only: [:index, :create, :update, :destroy]

   # get 'todolists', to: 'todolists#index', as: :api_todolists_path
   # post 'todolists', to: 'todolists#create', as: :api_todolists_path
   # put 'todolists/:id', to: 'todolists#update', as: :api_todolists_path
   # patch 'todolists/:id', to: 'todolists#dupdate', as: :api_todolists_path
   # destroy 'todolists/:id', to: 'todolists#destroy', as: :api_todolists_path


  end
   # Defines the root path route ("/")
  root "pages#home"
end
