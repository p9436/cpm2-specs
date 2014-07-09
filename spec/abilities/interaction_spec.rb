require 'spec_helper'
require 'cancan/matchers'

describe Interaction do
  describe Ability do

    subject { ability }
    let(:interaction)   { Fabricate :interaction }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should be_able_to(:create, Interaction.new) }
      it{ should_not be_able_to(:manage, interaction) }
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should_not be_able_to(:manage, interaction) }
    end

  end
end


