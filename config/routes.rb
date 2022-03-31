Rails.application.routes.draw do
  get '/users', to: 'users#get_users'
  resources :users
end
