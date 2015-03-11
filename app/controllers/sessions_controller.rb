class SessionsController < ApplicationController

  ### Create:
  def create
    @user ||= User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    flash[:notice] = 'Signed In!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
    flash[:notice] = "Logged Out!"
  end

end
