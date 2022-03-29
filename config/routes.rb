Rails.application.routes.draw do
  resources :contacts_distinct_ids
  resources :users
  resources :visitors
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
