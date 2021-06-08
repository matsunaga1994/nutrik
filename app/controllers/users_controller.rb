class UsersController < ApplicationController
  def show
    @foods = Food.where(user_id: current_user.id)
    @user = User.find(params[:id])
  end
end