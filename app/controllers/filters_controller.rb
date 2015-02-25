class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  
  ### Create

  def new
    @filter = current_user.filters.new
  end

  def create
    @filter = current_user.filters.new(filter_params)

    if @filter.save
      redirect_to user_path(current_user)
      flash[:notice] = "Filter #{@filter.name} has been created"
    else
      render :new
      flash[:alert] = "Problem creating this filter"
    end

    

  end





  # def create
  #   @filter = current_user.filters.create(filter_params)
  #   respond_to do |format|
  #   if @filter.save
        
  #         format.html { redirect_to user_path(current_user), notice: "Filter #{filter.name} has been created!" }
  #         format.json { render json: @filter, status: :created, location: current_user.filters }

  #     else 
        
  #         format.html { render :new, alert: "Problem adding your filter. Try again, or contact me: @dimanyc" }
  #         format.json { render json: @filter.errors, status: :unprocessable_entity }
        
  #     end
  #   end
  # end
  
  ### Read: 
  def index
    #@filters = current_user.filters
  end 

  def show
  end 

  private

  def set_filter
    self.slips = []
    
  end

  def filter_params
    params.require(:kozlina).permit(:name,:description,:slips,:user_id,:case_sensitive,:keep_slips_order)
  end
end
