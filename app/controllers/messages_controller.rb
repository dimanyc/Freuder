class MessagesController < ApplicationController
  before_action :authenticate, :set_user
  
  def new 
    @message = Message.new 
  end

  def update
    @messages = Message.refresh_tweets(@user)
    
    respond_to do |format|
      if @messages
        format.html{ redirect_to user_path(@user), notice: "Messages have been added" }
        format.json{}
      else
        format.html{}
        format.json{}
      end
    end  
  end

  private
  def set_user
    @user = current_user
  end

end
