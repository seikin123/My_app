class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redairect_to user_path(current_user)
  end
end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'successfully updated!'
    else
      render :edit
  end
end
  private
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
