class UsersController < ApplicationController
  require 'rest-client'
  require 'open-uri'

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end
  
  def get_user_pic(user)
    IO.copy_stream(URI.parse(user['picture']['large']).open , './app/assets/images/users-large/' + user["login"]["username"] + '.jpg')
    IO.copy_stream(URI.parse(user['picture']['medium']).open , './app/assets/images/users-medium/' + user["login"]["username"] + '.jpg')
    IO.copy_stream(URI.parse(user['picture']['thumbnail']).open , './app/assets/images/users-thumbnail/' + user["login"]["username"] + '.jpg')
  end

  def new_users
    url = 'https://randomuser.me/api/?results=2'

    JSON.parse(RestClient.get(url))['results'].map do |user|
      User.create(data: user)
      get_user_pic(user)
    end

    render json: User.all

  end
end
