class MessagesController < ApplicationController
  before_action :authenticate, :set_user
  
  def new 
    @message = Message.new
  end

  def create
    @message = @user.messages.new(message_params)
    @message.author = @user 

    if @message.save!
      @user.twitter.update(@message.body)
      flash[:notice] = "Message Sent"
    elsif @message.body.empty?
      flash[:alert] = "Cannot send an empty message"
    else
      flash[:alert] = "Problem sending your message"
    end
    redirect_to user_path(current_user)
  
  end

  def update
    @messages = Message.pull_tweets(@user)
    @filters = @user.filters.each { |filter| filter.analyze_tweets(@user) }

      if @messages && @filters
        flash.now[:notice] = 'Successfully updated the message queue'
      else
        flash.now[:alert] = "Something went wrong"
      end

      redirect_to user_path(@user)

  end

  def empty_the_user_message_queue
    @empty_user_messages = @user.messages.destroy_all

    respond_to do |format|

      if @empty_user_messages
        flash.now[:notice] = 'Messages have been deleted'
        format.html { redirect_to user_path(@user) }
        format.json {} 
        format.js {} 
      else
        flash[:alert] = "Problem..."
        redirect_to user_path(@user)
        format.json {render :new}
      end

    end
  end

  def empty_the_filter_message_queue

    @filters = @user.filters.each { |filter| filter.remove_filtered_messages(@user) }

    respond_to do |format|

      if @filters
        flash.now[:notice] = 'Messages have been deleted'
        format.html { redirect_to user_path(@user) }
        format.json {} 
      else
        flash[:alert] = "Problem..."
        redirect_to user_path(@user)
      end

    end  

  end

  private

  def set_user
    @user = current_user
  end

  def message_params
    params.require(:message).permit(:body,:author, user_parameters:[:username])
  end

end
