Rails.application.routes.draw do
  get '/new-users', to: 'users#new_users'
  resources :users
end
