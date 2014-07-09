require "spec_helper"

describe "routes to the clients controller" do
  it "should be valid routes" do
    
    { :get => "/clients" }.
      should route_to(:controller => 'clients', :action => 'index')

    { :get => "/clients/new" }.
      should route_to(:controller => 'clients', :action => 'new')

    { :post => "/clients/" }.
      should route_to(:controller => 'clients', :action => 'create')

    { :get => "/clients/1" }.
      should route_to(:controller => 'clients', :action => 'show', :id => '1')

    { :get => "/clients/1/edit" }.
      should route_to(:controller => 'clients', :action => 'edit', :id => '1')

    { :put => "/clients/1" }.
      should route_to(:controller => 'clients', :action => 'update', :id => '1')

    { :delete => "/clients/1" }.
      should route_to(:controller => 'clients', :action => 'destroy', :id => '1')

  end
end