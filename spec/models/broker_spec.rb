# == Schema Information
# Schema version: 20130725105759
#
# Table name: brokers
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string(120)
#  surname           :string(120)
#  comission_percent :integer
#  salary            :integer
#  avs_nunber        :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Broker do

  before :all do
    @broker = Fabricate :broker
  end

  it { @broker.valid?.should be_true }

  it 'should be assigned to user' do
    user = Fabricate :user
    @broker.update_attribute :user_id, user.id
    @broker.user_id.should be_eql user.id
    user.broker.should be_eql @broker
  end



end
