class SessionsController < ApplicationController
  def new
    @hide_login = true
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    puts user
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
