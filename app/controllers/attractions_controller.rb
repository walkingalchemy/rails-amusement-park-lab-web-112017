class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      #add stuff for flash errors
      redirect_to new_attraction_path
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.assign_attributes(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = @attraction.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
