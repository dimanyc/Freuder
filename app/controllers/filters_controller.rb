class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  
  ### Create
  def create
    @filter = current_user.filters.create(filter_params)
    respond_to do |format|
    if @filter.save
        
          format.html { redirect_to user_path(current_user), notice: "Filter #{filter.name} has been created!" }
          format.json { render json: @filter, status: :created, location: current_user.filters }

      else 
        
          format.html { render :new, alert: "Problem adding your filter. Try again, or contact me: @dimanyc" }
          format.json { render json: @filter.errors, status: :unprocessable_entity }
        
      end
    end
  end
  
  ### Read: 
  def index
    #@filters = current_user.filters
  end 

  def show
  end 

  private

  def set_filter
    #@filter = params[:id]
  end

  def filter_params
    params.require(:filter).permit(:name,:description,:slips)
  end
end
