class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
      flash[:success] = "Logged in!"
    else
      redirect_to login_url
      flash[:danger] = "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:success] = "Logged out!"
  end
end
