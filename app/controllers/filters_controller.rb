class FiltersController < ApplicationController

  ### Create
  def new
    @filter = current_user.filters.new
  end

  def create
    @filter = current_user.filters.new(filter_params)

    if @filter.save!
      redirect_to user_path(current_user)
      flash[:notice] = "Filter #{@filter.name} has been created"
    else
      redirect_to user_path(current_user)
      flash[:alert] = "Problem creating this filter"
    end

  end

  private

  def filter_params
    params.require(:kozlina).permit(:name,:description,:slips,:user_id,:case_sensitive,:keep_slips_order)
  end

end
