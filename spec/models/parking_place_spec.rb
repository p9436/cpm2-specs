# == Schema Information
# Schema version: 20131122103355
#
# Table name: parking_places
#
#  id           :integer          not null, primary key
#  name         :string(255)      indexed => [promotion_id]
#  promotion_id :integer          indexed => [name]
#  sale_id      :integer
#  price        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe ParkingPlace do
  
  before :all do
    @promotion = Fabricate :promotion
    @parking_place = @promotion.parking_places.first
  end

  it{ @parking_place.valid?.should be_true }

  it "should belong to Promotion" do
    @parking_place.promotion.should_not be_nil
  end
  
  it "should belong to Sale" do
    @parking_place.sale = Fabricate :sale
    @parking_place.sale.should_not be_nil
  end

end
