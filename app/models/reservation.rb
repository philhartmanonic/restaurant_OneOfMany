class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :owner
  validates :email, :time, :restaurant, 
end
