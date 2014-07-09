# == Schema Information
# Schema version: 20130726112845
#
# Table name: buildings
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  promotion_id :integer
#

require 'spec_helper'

describe Building do
  before :all do
    @building = Fabricate :building
  end

  it { @building.valid?.should be_true }

  it 'should has a lots' do
    @building.lots.should_not be_empty
  end

  it 'should has a parking places' do
    # @building.parking_places.should_not be_empty
  end

end
