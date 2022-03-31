class UsersController < ApplicationController
  require 'rest-client'

  def get_users
    url = 'https://randomuser.me/api/?seed=giga'
    response = RestClient.get(url)
    @users = JSON.parse(response)
    render json: @users
  end
end 
