Rails.application.routes.draw do
  root 'users#index'
  get '/import_users', to: 'users#import_users'
  resources :users
end
