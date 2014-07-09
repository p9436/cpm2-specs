require "spec_helper"

describe "routes to the interactions controller" do
  it "should be valid routes" do
    
    # { :get => "/clients/1/interactions" }.
    #   should route_to(:controller => 'interactions', :action => 'index', :client_id => '1')

    # { :get => "/clients/1/interactions/new" }.
    #   should route_to(:controller => 'interactions', :action => 'new', :client_id => '1')

    { :post => "/clients/1/interactions" }.
      should route_to(:controller => 'interactions', :action => 'create', :client_id => '1')

    # { :get => "/clients/1/interactions/1" }.
    #   should route_to(:controller => 'interactions', :action => 'show', :id => '1', :client_id => '1')

    # { :get => "/clients/1/interactions/1/edit" }.
    #   should route_to(:controller => 'interactions', :action => 'edit', :id => '1', :client_id => '1')

    # { :put => "/clients/1/interactions/1" }.
    #   should route_to(:controller => 'interactions', :action => 'update', :id => '1', :client_id => '1')

    # { :delete => "/clients/1/interactions/1" }.
    #   should route_to(:controller => 'interactions', :action => 'destroy', :id => '1', :client_id => '1')

    { :get => "/interactions/search_sale_objects" }.
      should route_to(:controller => 'interactions', :action => 'search_sale_objects')

  end
end