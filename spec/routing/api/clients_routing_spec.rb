require "spec_helper"

describe "routes to the api clients controller" do
  it "should be valid routes" do
    
    { :post => "/clients/" }.
      should route_to(:controller => 'clients', :action => 'create')

  end
end