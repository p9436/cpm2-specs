require "spec_helper"

describe "routes to the brokers controller" do
  it "should be valid routes" do
    
    { :get => "/sales" }.
      should route_to(:controller => 'sales', :action => 'index')

    { :get => "/sales/new" }.
      should route_to(:controller => 'sales', :action => 'new')

    { :post => "/sales/" }.
      should route_to(:controller => 'sales', :action => 'create')

    { :get => "/sales/1" }.
      should route_to(:controller => 'sales', :action => 'show', :id => '1')

    { :get => "/sales/1/edit" }.
      should route_to(:controller => 'sales', :action => 'edit', :id => '1')

    { :put => "/sales/1" }.
      should route_to(:controller => 'sales', :action => 'update', :id => '1')

    { :delete => "/sales/1" }.
      should route_to(:controller => 'sales', :action => 'destroy', :id => '1')


    { :get => "/clients/1/sales/new" }.
      should route_to(:controller => 'sales', :action => 'new', :client_id => '1')
  end
end