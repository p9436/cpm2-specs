require "spec_helper"

describe "routes to the goals controller" do
  it "should be valid routes" do

    { :get => "/brokers/1/bonus_goals/new" }.
      should route_to(:controller => 'goals', :action => 'new', :broker_id => '1', :goal_type => 'bonus')
    { :post => "/brokers/1/bonus_goals" }.
      should route_to(:controller => 'goals', :action => 'create', :broker_id => '1', :goal_type => 'bonus')
    { :get => "/brokers/1/bonus_goals/1/edit" }.
      should route_to(:controller => 'goals', :action => 'edit', :broker_id => '1', :id => '1', :goal_type => 'bonus')
    { :put => "/brokers/1/bonus_goals/1" }.
      should route_to(:controller => 'goals', :action => 'update', :broker_id => '1', :id => '1', :goal_type => 'bonus')


    { :get => "/brokers/1/annual_goals/new" }.
      should route_to(:controller => 'goals', :action => 'new', :broker_id => '1', :goal_type => 'annual')
    { :post => "/brokers/1/annual_goals" }.
      should route_to(:controller => 'goals', :action => 'create', :broker_id => '1', :goal_type => 'annual')
    { :get => "/brokers/1/annual_goals/1/edit" }.
      should route_to(:controller => 'goals', :action => 'edit', :broker_id => '1', :id => '1', :goal_type => 'annual')
    { :put => "/brokers/1/annual_goals/1" }.
      should route_to(:controller => 'goals', :action => 'update', :broker_id => '1', :id => '1', :goal_type => 'annual')

  end


end