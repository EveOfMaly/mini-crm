Rails.application.routes.draw do
 
  #welcome page 
  root "static#home"
  get "/welcome-to-crm", to: "users#welcome"
  post "/welcome-to-crm", to: "users#welcome_create_lead"

  #sign-up with google or signup via crm
  get "/signup", to: "users#new"
  
  #track users across website
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
   
    
  get "/apps/:id/home", to: "apps#home", as: "home" #quick start guide
  resources :users #set some of routes only for admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #user
  resources :apps, only: [:show, :create, :edit, :update, :destroy] do 
    resources :users, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
    resources :visitors, only: [:index, :new,  :show, :create, :edit, :update, :destroy] 
    resources :contacts, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
    resources :pages
  end

  #possibly add verification if main elements are there.

  #oauth
  get '/auth/:provider/callback', to: 'sessions#omniauth'



 
end
