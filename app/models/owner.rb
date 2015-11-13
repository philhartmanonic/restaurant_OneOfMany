class Owner < ActiveRecord::Base
  devise :database_authenticatable, :registerable

  has_many :restaurants
end
