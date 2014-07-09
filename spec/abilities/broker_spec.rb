require 'spec_helper'
require 'cancan/matchers'

describe Broker do
  describe Ability do

    subject { ability }
    let(:broker)   { Fabricate :broker }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should be_able_to(:read, broker) }
      it{ should_not be_able_to(:manage, broker) }
      let(:broker){ Fabricate :broker, user_id: user.id }
      it{ should_not be_able_to(:manage, broker) }
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should be_able_to(:manage, broker) }
    end

  end
end


