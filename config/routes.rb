Rails.application.routes.draw do
  resources :contacts_visitors
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :visitors #known or unknown user visiting the site
  resources :contacts #see all contacts and CRUD contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"



  #user
  #possibly add verification if main elements are there.

  #welcome page 
  get "/welcome-to-crm", to: "users#welcome"
   
  #sign-up with google or signup via crm
  get "/signup", to: "users#new"
  
  #track users across website
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get "/apps/vspdssd/home", to: "application#home" #quick start guide
  get "/apps/vspdssd/crm", to: "contacts#index" #see all contacts
  get "/apps/vspdssd/crm", to: "contacts#new"  #create a new contact
  post "/apps/vspdssd/crm", to: "contacts#new"  #create a new contact


  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
