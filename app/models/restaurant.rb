class Restaurant < ActiveRecord::Base
  has_many :reservations
  belongs_to :owner
  accepts_nested_attributes_for :reservations

  validates_presence_of :name

  def is_owner?(an_owner)
    self.owner_id == an_owner.id
  rescue
    false
  end
end
