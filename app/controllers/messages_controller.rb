class MessagesController < ApplicationController
  before_action :authenticate, :set_user
  rescue_from ActiveRecord::RecordNotUnique, with: :my_rescue_method
  
  def new 
    @message = Message.new 
  end

  def update
    @messages = Message.pull_tweets(@user)
    @filters = @user.filters.each { |filter| filter.analyze_tweets(@user) }

    respond_to do |format|

      if @messages && @filters
        flash.now[:notice] = 'Successfully updated the message queue'

        format.html { redirect_to user_path(@user) }
        format.json {}
      else
        format.html {}
        format.json {}
      end

    end  
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



end
