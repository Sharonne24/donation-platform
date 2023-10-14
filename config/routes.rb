Rails.application.routes.draw do
  # get 'charities/apply'
  # get 'charities/edit'
  # get 'charities/update'
  # get 'charities/donors'
  # get 'charities/donations'
  # get 'charities/stories'
  # get 'charities/beneficiaries'
  # get 'charities/automated_donations'
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

  post '/charities/:id/donate', to: 'charities#donate', as: 'donate_to_charity'

  # apply to become a charity
  post '/charities/apply', to: 'charities#apply'
  # view charity details
  get '/charities/:id', to: 'charities#show'
  get '/charities', to: 'charities#index'
  # edit charity details
  get '/charities/:id/edit', to: 'charities#edit'
  # update charity details
  put '/charities/:id/update', to: 'charities#update'
  patch '/charities/:id/update', to: 'charities#update'

  # Donations Routes
  resources :donations

  # Beneficiaries Routes
  resources :beneficiaries

  # Admin Routes
  resources :admin

  # Stories Routes
  resources :stories

  # Additional custom routes
  # e.g., route for donating to a specific charity
  post '/charities/:id/donate', to: 'charities#donate', as: 'donate_to_charity'

  # Routes related to charity management
  resources :charities do
    post 'apply', on: :member
    get 'edit', on: :member
    put 'update', on: :member
  end

  devise_for :users

end
