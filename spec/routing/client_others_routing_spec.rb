require "spec_helper"

describe ClientOthersController do
  describe "routing" do

    it "routes to #index" do
      get("/client_others").should route_to("client_others#index")
    end

    it "routes to #new" do
      get("/client_others/new").should route_to("client_others#new")
    end

    it "routes to #show" do
      get("/client_others/1").should route_to("client_others#show", :id => "1")
    end

    it "routes to #edit" do
      get("/client_others/1/edit").should route_to("client_others#edit", :id => "1")
    end

    it "routes to #create" do
      post("/client_others").should route_to("client_others#create")
    end

    it "routes to #update" do
      put("/client_others/1").should route_to("client_others#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/client_others/1").should route_to("client_others#destroy", :id => "1")
    end

  end
end
