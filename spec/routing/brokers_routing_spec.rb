require "spec_helper"

describe "routes to the brokers controller" do
  it "should be valid routes" do
    
    { :get => "/brokers" }.
      should route_to(:controller => 'brokers', :action => 'index')

    { :get => "/brokers/new" }.
      should route_to(:controller => 'brokers', :action => 'new')

    { :post => "/brokers/" }.
      should route_to(:controller => 'brokers', :action => 'create')

    { :get => "/brokers/1" }.
      should route_to(:controller => 'brokers', :action => 'show', :id => '1')

    { :get => "/brokers/1/edit" }.
      should route_to(:controller => 'brokers', :action => 'edit', :id => '1')

    { :put => "/brokers/1" }.
      should route_to(:controller => 'brokers', :action => 'update', :id => '1')

    { :delete => "/brokers/1" }.
      should route_to(:controller => 'brokers', :action => 'destroy', :id => '1')

  end
end