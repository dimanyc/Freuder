class UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user, only: [:show]

  ### Read:
  def show
 
    @image = @user.image_url.gsub!("_normal","")
    @messages = @user.messages.order(:created_at).uniq 
    @message = Message.new 
    #@filtered_messages = Filter.find_by(user_id: @user.id).try(:messages)
    #@filtered_messages = @user.filters.map { |filter| filter.messages } #@user.messages.map{ |message| message.filters }
    #@filtered_messages = @user.filter_messages#Message.joins(:filters).where(filters {user: @user})
    @filtered_messages = @user.filters.includes(:messages).map { |filter| filter.messages }.flatten
    #@filtered_messages = @user.messages.includes(:filters).map { |message| message.filters }.flatten
    #@user.filters.find_by(user: @user).messages
    @filters = @user.filters
    @filter = Filter.new
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
