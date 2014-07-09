require "spec_helper"

describe "routes to the buildings controller" do
  it "should be valid routes" do
    
    { :get => "/buildings" }.
      should route_to(:controller => 'buildings', :action => 'index')

    { :get => "/buildings/new" }.
      should route_to(:controller => 'buildings', :action => 'new')

    { :post => "/buildings/" }.
      should route_to(:controller => 'buildings', :action => 'create')

    { :get => "/buildings/1" }.
      should route_to(:controller => 'buildings', :action => 'show', :id => '1')

    { :get => "/buildings/1/edit" }.
      should route_to(:controller => 'buildings', :action => 'edit', :id => '1')

    { :put => "/buildings/1" }.
      should route_to(:controller => 'buildings', :action => 'update', :id => '1')

    { :delete => "/buildings/1" }.
      should route_to(:controller => 'buildings', :action => 'destroy', :id => '1')

  end
end