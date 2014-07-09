require "spec_helper"

describe "routes to the lots controller" do
  it "should be valid routes" do
    
    { :get => "/lots" }.
      should route_to(:controller => 'lots', :action => 'index')

    { :get => "/lots/new" }.
      should route_to(:controller => 'lots', :action => 'new')

    { :post => "/lots/" }.
      should route_to(:controller => 'lots', :action => 'create')

    { :get => "/lots/1" }.
      should route_to(:controller => 'lots', :action => 'show', :id => '1')

    { :get => "/lots/1/edit" }.
      should route_to(:controller => 'lots', :action => 'edit', :id => '1')

    { :put => "/lots/1" }.
      should route_to(:controller => 'lots', :action => 'update', :id => '1')

    { :delete => "/lots/1" }.
      should route_to(:controller => 'lots', :action => 'destroy', :id => '1')


    { :get => "/buildings/1/lots" }.
      should route_to(:controller => 'lots', :action => 'index', :building_id => '1')

  end


end