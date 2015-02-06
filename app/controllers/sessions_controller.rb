class SessionsController < ApplicationController

  ### Create:
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    flash[:notice] = 'Signed In!'
  end

end
