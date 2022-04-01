Rails.application.routes.draw do
  resources :contacts_visitors
  resources :visitors #known or unknown user visiting the site
  resources :contacts #see all contacts and CRUD contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"

  #user
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy] do 
    resources :visitors, only: [:show, :index]
    resources :contacts, only: [:show, :index]
    resources :pages
  end

  #possibly add verification if main elements are there.

  #welcome page 
  get "/welcome-to-crm", to: "users#welcome"
    post "/welcome-to-crm", to: "users#welcome_create_lead"
   
  #sign-up with google or signup via crm
  get "/signup", to: "users#new"
  
  #track users across website
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  #oauth
  get '/auth/:provider/callback', to: 'sessions#omniauth'


  # get "/user/app/home", to: "application#home" #quick start guide
  # get "/user/app/crm", to: "contacts#index" #see all contacts
  # get "/user/app/crm/new", to: "contacts#new"  #create a new contact
  # post "/user/app/crm", to: "contacts#new"  #create a new contact


 
end
