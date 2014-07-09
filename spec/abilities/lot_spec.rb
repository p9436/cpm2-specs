require 'spec_helper'
require 'cancan/matchers'

describe Lot do
  describe Ability do

    subject { ability }
    let(:lot)   { Fabricate :lot }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should_not be_able_to(:create, Lot.new) }
      it{ should_not be_able_to(:manage, lot) }
      it{ should be_able_to(:read, lot) }
    end

    context 'for Superadmin' do
      let(:user) do
        user = Fabricate :user
        user.stub('superadmin?').and_return(true)
        user
      end
      it { should be_able_to(:manage, lot) }
    end

  end
end


