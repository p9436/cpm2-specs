require 'spec_helper'
describe InteractionsController do
  login_superadmin

  describe "POST #create" do
    it "responds successfully with an HTTP 302 status code" do
      client = Fabricate :client
      user = Fabricate :user, broker: Fabricate(:broker)
      controller.stub(:current_user).and_return(user)
      controller.request.stub referer: client_url(client)
      post :create, :client_id => client.id, :interaction => { :comment => 'Send email' }
      expect(response).to be_redirect
      expect(response.status).to eq(302)
      expect(Interaction.last.broker).to eq(user.broker)
    end
  end

  describe "GET #search_sale_objects" do
    describe "should return JSON" do
      before :all do |variable|
        lot = Fabricate :lot, name: 'A1'
        parking_place = Fabricate :parking_place, name: 'p1'
      end
      it "should find A1" do
        get :search_sale_objects, format: :json, q: 'A'
        expect(ActiveSupport::JSON.decode(response.body)).to_not be_empty
      end
      it "should find p1" do
        get :search_sale_objects, format: :json, q: 'p'
        expect(ActiveSupport::JSON.decode(response.body)).to_not be_empty
      end
      it "should not find B" do
        get :search_sale_objects, format: :json, q: 'B'
        expect(ActiveSupport::JSON.decode(response.body)).to be_empty
      end
    end
  end
end
