class MessagesController < ApplicationController
  before_action :authenticate, :set_user
  
  def new 
    @message = Message.new 
  end

  def update
   ###### @messages = Message.refresh_tweets(@user)
    @messages = Message.pull_tweets(@user)
    @filters = Filter.analyze_tweets(@user)

    respond_to do |format|

      if @messages && @filters
        flash.now[:notice] = 'Successfully updated the message queue'

        #@messages.each evaluate_messages(@user, @messages, @user.filters)
        format.html { redirect_to user_path(@user) }
        format.json {}
      else
        format.html {}
        format.json {}
      end

    end  
  end

  def empty_the_user_message_queue
    @messages = Message.where(owner_id: @user.id).update_all(owner_id: nil)

    respond_to do |format|

      if @messages
        flash.now[:notice] = 'Messages have been deleted'
        format.html { redirect_to user_path(@user) }
        format.json {} 
      else
        flash[:alert] = "Problem..."
        redirect_to user_path(@user)
      end

    end
  end

  def empty_the_filter_message_queue
    #@filters = Filter.where(user_id: @user.id).try(:messages).update_all(processor_id: nil)
    #@filters = { |filter| filter.remove_filtered_messages(@user) }
    @filters = @user.filters.each do |filter|
      filter.remove_filtered_messages(@user)
    end

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
