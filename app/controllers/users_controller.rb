class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:now] = "successful sign up"
      redirect_to users_path
    else
      flash[:now] = "bad sign up"
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
