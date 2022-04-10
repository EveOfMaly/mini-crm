Rails.application.routes.draw do
 
  resources :visitor_pages
  resources :contacts, only: [:index, :new, :show, :create, :edit, :update, :destroy]  #set to admin only
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
   
    
  resources :users, only: [:index, :create] #set some of routes only for admin
  resources :visitors, only: [:index, :new, :create]
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #user
  resources :apps, only: [:show, :create, :edit, :update, :destroy] do 
    resources :users, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    resources :visitors, only: [:index, :new,  :show, :create, :edit, :update, :destroy]
    resources :contacts, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    resources :pages
  end

  post "/submission", to: "contacts#contact_created_from_page"

  #possibly add verification if main elements are there.

  #oauth
  get '/auth/:provider/callback', to: 'sessions#omniauth'



 
end
