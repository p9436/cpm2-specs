require 'spec_helper'
require 'cancan/matchers'

describe Client do
  describe Ability do

    subject { ability }
    let(:broker)  { Fabricate(:broker) }
    let(:client)  { Fabricate :client, broker: broker }
    let(:ability) { Ability.new(user)  }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: broker }
      it{ should be_able_to(:create, Client.new) }
      it{ should_not be_able_to(:manage, client) }
      it{ should be_able_to(:archive, client) }
      it{ client.destroy; should_not be_able_to(:archive, client) }
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should be_able_to(:create, client) }
      it { should be_able_to(:read, client) }
      it { should be_able_to(:update, client) }
      it { should be_able_to(:archive, client) }
      it { should_not be_able_to(:delete, client) }
    end

  end
end


