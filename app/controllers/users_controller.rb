class UsersController < ApplicationController
  require 'rest-client'
  require 'open-uri'

  def index
    @users = User.page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def get_user_pic(picture, username, size)
    IO.copy_stream(URI.parse(picture).open, "./public/images/users-#{size}/#{username}.jpg")
  end

  def new_users
    url = 'https://randomuser.me/api/?results=30'

    JSON.parse(RestClient.get(url))['results'].map do |user|
      User.create(data: user)
      picture = user['picture']
      username = user['login']['username']
      get_user_pic(picture['large'], username, 'large')
      get_user_pic(picture['medium'], username, 'medium')
      get_user_pic(picture['thumbnail'], username, 'thumbnail')
    end

    render json: User.all
  end
end
