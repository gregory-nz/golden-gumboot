class UsersController < ApplicationController
  def new
    index_redirect
    @hide_login = true
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    elsif @user.password != @user.password_confirmation
      flash.now[:danger] = 'Passwords do not match'
      render 'new'
    else
      flash.now[:danger] = 'Username not available'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def index_redirect
    redirect_to root_path if logged_in?
  end
end
