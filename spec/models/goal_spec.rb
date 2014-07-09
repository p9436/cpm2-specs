# == Schema Information
# Schema version: 20130819083457
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  broker_id  :integer          indexed
#  start_at   :date
#  end_at     :date
#  turnover   :integer          default(0)
#  target     :integer          default(0)
#  reward     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'


describe Goal do
  before :all do
    @goal = Fabricate :goal
  end
  it 'should be valid record' do
    @goal.valid?.should be_true
  end
  it 'should return only current goals' do
    Fabricate :goal, start_at: '2012-01-01', end_at: '2012-12-31'
    Fabricate :goal, start_at: '2013-01-01', end_at: '2013-12-31'
    Fabricate :goal, start_at: '2014-01-01', end_at: '2014-12-31'
    expect(Goal.current.size).to eq(1)
  end
end

describe AnnualGoal do
  before :each do
    @annual_goal = Fabricate :annual_goal, year: 2000
  end

  it 'should be valid' do
    @annual_goal.update_attribute :year, 2020
    @annual_goal.valid?.should be_true
  end

  it 'should set start-end date' do
    @annual_goal.year = 2013
    expect(@annual_goal.start_at.to_s).to eq('2013-01-01')
    expect(@annual_goal.end_at.to_s).to eq('2013-12-31')
  end

  it 'should return year' do
    @annual_goal.start_at = '2014-01-01'
    @annual_goal.end_at =   '2014-12-31'
    expect(@annual_goal.year).to eq(2014)
  end

  describe 'validation' do
    it 'should not save goals for the same year' do
      broker = Fabricate :broker
      @annual_goal.update_attributes year: 2013, broker: broker
      @annual_goal = Fabricate.build :annual_goal, year: 2013, broker: broker
      expect(@annual_goal.valid?).to be_false
    end
  end
end

describe BonusGoal do
  before :all do
    @bonus_goal = Fabricate :bonus_goal
  end
  it { @bonus_goal.valid?.should be_true }
end
