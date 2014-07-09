require 'spec_helper'
require 'cancan/matchers'

describe Referer do
  describe Ability do

    subject { ability }
    let(:referer)   { Fabricate :referer }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should_not be_able_to(:manage, referer) }
      it{ should_not be_able_to(:create, referer) }
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should be_able_to(:manage, referer) }
    end

  end
end