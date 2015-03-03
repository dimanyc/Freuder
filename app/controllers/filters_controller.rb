class FiltersController < ApplicationController
  before_action :set_user, only: [:create,:destroy]

  ### Create
  def new
    @filter = current_user.filters.new
  end

  def create
    @filter = @user.filters.new(filter_params)

    respond_to do |format|
      if @filter.save
        flash[:notice] = "#{@filter.name} has been created"
        format.json { render json: @filter, status: :created, location: @filters }
        format.html { redirect_to @user }        
        format.js {}
      else
        format.html { render :new, alert: "Problem adding your filter. Please try again or contact me directly: @dimanyc" }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end

  end

  ### Destroy 
  def destroy 
    @filter = Filter.find(params[:id])

    respond_to do |format|
      if @filter.destroy
        flash[:notice] = "Filter #{@filter.name} has been deleted"
        format.html { redirect_to @user }
        format.json { }
        format.js { }
      else
        format.html { }
      end
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

