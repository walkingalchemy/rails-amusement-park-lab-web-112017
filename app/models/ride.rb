class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction



  def take_ride
    user
    attraction
    errors = ["Sorry."]
    if !enough_tickets
      errors << "You do not have enough tickets the #{attraction.name}."
    end
    if !enough_height
      errors << "You are not tall enough to ride the #{attraction.name}."
    end
    if errors.size > 1
      errors.join(" ")
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    end

  end

  private

  def enough_tickets
    self.user.tickets > self.attraction.tickets
  end

  def enough_height
    self.user.height > self.attraction.min_height
  end

end
