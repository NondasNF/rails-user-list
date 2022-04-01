Rails.application.routes.draw do
  get '/import_users', to: 'users#import_users'
  resources :users
end
