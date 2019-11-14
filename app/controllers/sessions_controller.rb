class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:info] = "invalid credentials"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
