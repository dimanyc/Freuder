class MessagesController < ApplicationController
  before_action :authenticate
  
  def new 
    @message = Message.new 
  end

  def update
    
  end

end
