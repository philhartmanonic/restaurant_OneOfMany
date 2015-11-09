class Owner < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable
end
