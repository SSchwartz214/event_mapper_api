class Api::V1::UsersController < ApplicationController
  def create 
    user = User.update_or_create(user_params)
    if user
      render json: user
    else
      render status: 400
    end
  end


  private

    def user_params
      params.require(:user).permit(:given_name, :family_name, :email, :google_id)
    end
end