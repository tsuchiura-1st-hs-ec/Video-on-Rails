class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:settings]

  def show
    @user = User.find_by(username: params[:username])
    @items = Item.where(user_id: @user.id)
  end

  def settings
    @user = User.find(current_user.id)
  end
end
