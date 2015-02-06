class UsersController < ApplicationController
  ### Create:

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save      
        format.html{ redirect_to user_path(@user), notice: "Welcome, #{@user.username}!" }
        format.json{ render json: @user, status: :create, location: @user }
      else
        format.html{ render action: 'new'}
        format.json{ render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ### Read:

  def show
  end

  ### Strong Params:

  private 

  def user_params
    params.require(:user).permit(:username,:uid,:provider,:image_url)
  end

end
