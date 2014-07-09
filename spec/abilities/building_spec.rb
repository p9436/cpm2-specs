require 'spec_helper'
require "cancan/matchers"

describe Building do
  describe Ability do

    subject { ability }
    let(:building)   { Fabricate :building }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should be_able_to(:read, building) }
      it{ should_not be_able_to(:create, Building.new) }
      it{ should_not be_able_to(:manage, building) }
    end

    context 'for Superadmin' do
      let(:user) do
        user = Fabricate :user
        user.stub('superadmin?').and_return(true)
        user
      end
      it { should be_able_to(:manage, building) }
    end

  end
end

