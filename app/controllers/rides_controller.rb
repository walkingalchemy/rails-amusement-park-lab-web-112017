class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    if @ride.valid?
      @ride.save
      @ride.take_ride
      flash[:message] = "Thank You for riding #{@ride.attraction.name}"
      redirect_to user_path(@ride.user)

    else
      flash[:error] = "Why!?"
      byebug
    end
  end



  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
