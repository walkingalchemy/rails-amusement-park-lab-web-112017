class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def total_users
    5
    #self.rides.uniq.count #FIXME this!
  end
end
