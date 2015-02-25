class MessagesController < ApplicationController
  before_action :set_columns_to_array, :authenticate
  
  def new 
    @message = Message.new 
  end

end
