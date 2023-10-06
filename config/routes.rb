Rails.application.routes.draw do
  get 'charities/apply'
  get 'charities/edit'
  get 'charities/update'
  get 'charities/donors'
  get 'charities/donations'
  get 'charities/stories'
  get 'charities/beneficiaries'
  get 'charities/automated_donations'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
   get 'users/create'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :charities, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  resources :charities do
    post 'apply', on: :collection
  end
end
