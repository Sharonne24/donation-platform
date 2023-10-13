Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :charities, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

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
