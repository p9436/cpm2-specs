require 'spec_helper'


describe PromotionsController do
  login_superadmin
  render_views

  before :all do
    @promotion = Fabricate :promotion
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      response.should render_template('index')
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => @promotion.id
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

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit, :id => @promotion.id
      expect(response).to be_success
      expect(response.status).to eq(200)
      response.should render_template('edit')
    end
  end


  describe "GET #create" do
    it "responds successfully with an HTTP 302 status code" do
      post :create, :promotion => { :name => 'Jamison Wood', 
                                    :buildings_attributes => { 0 => { :name => 'RedTowe' } },
                                    :parking_places_attributes => { 0 => { :name => 'p1' } } }
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


  describe "GET #update" do
    it "responds successfully with an HTTP 302 status code" do
      put :update, :id => @promotion.id, :promotion => { :name => 'Jamison Wood', 
                                         :buildings_attributes => { 0 => { :name => 'RedTowe' } },
                                         :parking_places_attributes => { 0 => { :name => 'p1' } } }
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


  describe "GET #destroy" do
    it "responds successfully with an HTTP 302 status code" do
      delete :destroy, :id => @promotion.id
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


end
