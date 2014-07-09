require 'spec_helper'
require 'cancan/matchers'

describe Promotion do
  describe Ability do

    subject { ability }
    let(:promotion)   { Fabricate :promotion }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should_not be_able_to(:create, Promotion.new) }
      it{ should_not be_able_to(:manage, promotion) }

      it 'can read promotion that associated with broker' do
        promotion.brokers << user.broker
        should be_able_to(:read, promotion)
      end
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should be_able_to(:read, promotion) }
    end

  end
end