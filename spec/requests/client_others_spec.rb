require 'spec_helper'

describe "ClientOthers" do
  describe "GET /client_others" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get client_others_path
      response.status.should be(200)
    end
  end
end
