class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  ### Create:
  def create
  end

  ### Read:
  def show
    @image = current_user.image_url.gsub!("_normal","")
  end


  ### Strong Params:
  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:uid,:provider,:image_url)
  end

end
