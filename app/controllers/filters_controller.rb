class FiltersController < ApplicationController
  before_action :set_user, only: [:create,:destroy]

  ### Create
  def new
    @filter = current_user.filters.new
  end

  def create
    @filter = @user.filters.new(filter_params)

    if @filter.save!
      @filter.split_to_array(@filter.slips)
      redirect_to user_path(@user)
      flash[:notice] = "Filter #{@filter.name} has been created"
    else
      redirect_to user_path(@user)
      flash[:alert] = "Problem creating this filter"
    end

  end
 
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def filter_params
    params.fetch(:filter, {}).permit(:name,:description,:slips,:user_id,:case_sensitive,:keep_slips_order)
  end

end

