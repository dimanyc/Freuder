class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  
  ### Create
  def create
    @filter = Filter.new(filter_params)
  end
  
  ### Read: 
  def index
    @filters = current.user.filters
  end 

  def show
  end 

  private

  def set_filter
    @filter = params[:id]
  end

  def filter_params
    params.require(:filter).permit(:name,:description,:slips)
  end
end
