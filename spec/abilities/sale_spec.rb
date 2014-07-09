require 'spec_helper'
require "cancan/matchers"

describe Sale do
  describe Ability do

    subject { ability }
    let(:sale)   { Fabricate :sale }
    let(:ability){ Ability.new(user) }

    context 'for Broker' do
      let(:user){ Fabricate :user, broker: Fabricate(:broker) }
      it{ should be_able_to(:create, Sale.new) }
      it{ should_not be_able_to(:manage, sale) }
    end

    context 'for Admin' do
      let(:user) do
        user = Fabricate :user
        user.stub('admin?').and_return(true)
        user
      end
      it { should be_able_to(:edit, sale) }
    end

    # describe 'for Broker' do

    #   before :all do
    #     @current_user = Fabricate :user, broker: Fabricate(:broker)
    #     @current_ability = Ability.new(@current_user)
    #   end
    #   before :each do
    #     @sale = Fabricate :sale
    #   end

    #   it { @current_ability.should be_able_to(:create, Sale.new) }
    #   it { @current_ability.should_not be_able_to(:manage, @sale) }
    #   it 'should manage own sale' do
    #     @sale.broker = @current_user.broker
    #     @current_ability.should be_able_to(:manage, @sale)
    #   end
    # end
    # describe 'for Admin' do
    #   before :all do
    #     @sale = Fabricate :sale
    #     @current_user = Fabricate :user
    #     @current_user.stub('admin?').and_return(true)
    #     @current_ability = Ability.new(@current_user)
    #   end
    #   it { @current_ability.should be_able_to(:manage, @sale) }
    # end

  end
end


