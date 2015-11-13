require 'rails_helper'

describe Restaurant do
  it "must have a name to be saved" do
    restaurant = Restaurant.new
    expect(restaurant.valid?).to be false
  end

  describe '#is_owner?' do
    let(:owner) { Owner.create(email: 'b@b.com') }
    let(:restaurant) { Restaurant.new(name: 'A name', owner: owner) }

    it 'returns true if the owner submitted owns the restaurant' do
      expect(restaurant.is_owner?(owner)).to be true
    end

    it 'returns false if the owner submitted doesnt own the restaurant' do
      not_the_owner = Owner.create(email: 'a@a.com')
      expect(restaurant.is_owner?(not_the_owner)).to be false
    end

    it 'returns false if there is no owner submitted' do
      expect(restaurant.is_owner?(nil)).to be false
    end
  end
end
