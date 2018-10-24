class Api::V1::UsersController < ApplicationController
  def create 
    User.update_or_create(request.body)
  end
end