Rails.application.routes.draw do

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


  
    resources :charities, only: [:index, :show, :edit, :update]
    post '/charities/apply', to: 'charities#apply'
    patch '/charities/:id/approve-reject', to: 'charities#approve_reject'
   

  #  resources :charities, only: [:index]

   namespace :admin do
     resources :pending_charities, only: [:index]
   end

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

  # Routes related to charity management
  post '/charities/:id/donate', to: 'charities#donate', as: 'donate_to_charity'
  
  resources :charities do
    post 'apply', on: :member
    get 'edit', on: :member
    put 'update', on: :member
  end

  devise_for :users
  get '/callback', to: 'callbacks/paypal#order'
  post '/confirm_order', to: 'callbacks/paypal#confirm_order', as: 'confirm_order'
end
