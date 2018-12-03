class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    puts user
    if user && user.authenticate(params[:session][:password])
      puts 'attempting log in'
      log_in user
      redirect_to controller: 'surveys', action: 'index'
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private

  def session_params
  end

end
