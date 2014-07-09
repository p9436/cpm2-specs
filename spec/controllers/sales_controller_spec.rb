require 'spec_helper'

describe SalesController do

  describe 'as broker' do
    login_broker
    before :all do
      @lot = Fabricate :lot
      @client = Fabricate :client
    end
    describe "GET #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, :sale => {:client_id=> @client.id, :lot_id => @lot.id, :optioned_at => Time.now}
        expect(response).to be_redirect
        expect(response.status).to eq(302)
        expect(Sale.last.broker).to eq(@current_user.broker)
      end
    end

    describe "GET #search_sale_objects" do
      describe "should return JSON" do
        before :all do |variable|
          lot = Fabricate :lot, name: 'A1'
        end
        it "should find A1" do
          get :search_sale_objects, format: :json, q: 'A'
          expect(ActiveSupport::JSON.decode(response.body)).to_not be_empty
        end
        it "should not find Q" do
          get :search_sale_objects, format: :json, q: 'B'
          expect(ActiveSupport::JSON.decode(response.body)).to be_empty
        end
      end
    end

  end

  describe 'as superadmin' do
    login_superadmin
    render_views

    before :all do
      @lot = Fabricate :lot
      @client = Fabricate :client
      @sale = Fabricate :sale
    end

    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        # @sale.client = @client
        # @sale.save
        get :index
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('index')
      end
    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, :id => @sale.id
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('show')
      end
    end


    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('new')
      end
    end

    describe "GET #new with client id" do
      it "responds successfully with an HTTP 200 status code" do
        get :new, :client_id => @client.id
        expect(response).to be_success
        expect(response.status).to eq(200)
        assigns(:sale).client_id.should eq(@client.id)
        response.should render_template('new')
      end
    end

    describe "GET #edit" do
      it "responds successfully with an HTTP 200 status code" do
        get :edit, :id => @sale.id
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('edit')
      end
    end


    describe "GET #create" do
      it "responds successfully with an HTTP 302 status code" do
        user = Fabricate :user, broker: Fabricate(:broker)
        controller.stub(:current_user).and_return(user)

        post :create, :sale => {:client_id=> @client.id, :lot_id => @lot.id, :optioned_at => Time.now}
        expect(response).to be_redirect
        expect(response.status).to eq(302)
        expect(Sale.last.broker).to eq(user.broker)
      end
    end


    describe "GET #update" do
      it "responds successfully with an HTTP 302 status code" do
        put :update, :id => @sale.id, :sale => {:client_id => @client.id, :optioned_at => Time.now }
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end


    describe "GET #destroy" do
      it "responds successfully with an HTTP 302 status code" do
        delete :destroy, :id => @sale.id
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end
  end


end
