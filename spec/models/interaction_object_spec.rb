# == Schema Information
# Schema version: 20130909130705
#
# Table name: interactions_objects
#
#  id             :integer          not null, primary key
#  saleable_type  :string(255)      indexed => [interaction_id, saleable_id]
#  saleable_id    :integer          indexed => [interaction_id, saleable_type]
#  interaction_id :integer          indexed => [saleable_type, saleable_id]
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe InteractionObject do
  before :all do
    @interaction = Fabricate :interaction
    @lot = Fabricate :lot
    @parking_place = Fabricate :parking_place
  end

  it "should assign objects to interaction" do
    @interaction.lots << @lot
    @interaction.parking_places << @parking_place
    expect(@interaction.lots).to eq([@lot])
    expect(@interaction.parking_places).to eq([@parking_place])
  end
end
