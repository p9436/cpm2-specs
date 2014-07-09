require 'spec_helper'

describe ReferersController do
  login_superadmin
  render_views

  before :all do
    @referer = Fabricate :referer
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
      get :show, :id => @referer.id
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
      get :edit, :id => @referer.id
      expect(response).to be_success
      expect(response.status).to eq(200)
      response.should render_template('edit')
    end
  end


  describe "GET #create" do
    it "responds successfully with an HTTP 302 status code" do
      post :create, :referer => { :name => 'Jamison Wood', :contact_attributes => { :email => 'jamison@test.com', :phone1 => '555-55-55' } }
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


  describe "GET #update" do
    it "responds successfully with an HTTP 302 status code" do
      put :update, :id => @referer.id, :referer => { :name => 'Jamison' }
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


  describe "GET #destroy" do
    it "responds successfully with an HTTP 302 status code" do
      delete :destroy, :id => @referer.id
      expect(response).to be_redirect
      expect(response.status).to eq(302)
    end
  end


end
