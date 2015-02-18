class UsersController < ApplicationController
  #before_action :authenticate
  before_action :set_user, only: [:show]

  ### Read:
  def show
 
    @image = @user.image_url.gsub!("_normal","")

    @messages = @user.messages.order(:created_at)
    @message = Message.new 

    @filtered_messages = Filter.find_by(user_id:@user.id).try(:messages) 
    @filters = @user.filters
    @filter = Filter.new
    
  end


  private

  # def authenticate(user)
  #   if user.id == session[:user_id]
  #     return true
  #   end
  # end  

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:uid,:provider,:image_url)
  end

end
