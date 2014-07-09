require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ClientOthersController do

  # This should return the minimal set of attributes required to create a valid
  # ClientOther. As you add validations to ClientOther, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClientOthersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all client_others as @client_others" do
      client_other = ClientOther.create! valid_attributes
      get :index, {}, valid_session
      assigns(:client_others).should eq([client_other])
    end
  end

  describe "GET show" do
    it "assigns the requested client_other as @client_other" do
      client_other = ClientOther.create! valid_attributes
      get :show, {:id => client_other.to_param}, valid_session
      assigns(:client_other).should eq(client_other)
    end
  end

  describe "GET new" do
    it "assigns a new client_other as @client_other" do
      get :new, {}, valid_session
      assigns(:client_other).should be_a_new(ClientOther)
    end
  end

  describe "GET edit" do
    it "assigns the requested client_other as @client_other" do
      client_other = ClientOther.create! valid_attributes
      get :edit, {:id => client_other.to_param}, valid_session
      assigns(:client_other).should eq(client_other)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClientOther" do
        expect {
          post :create, {:client_other => valid_attributes}, valid_session
        }.to change(ClientOther, :count).by(1)
      end

      it "assigns a newly created client_other as @client_other" do
        post :create, {:client_other => valid_attributes}, valid_session
        assigns(:client_other).should be_a(ClientOther)
        assigns(:client_other).should be_persisted
      end

      it "redirects to the created client_other" do
        post :create, {:client_other => valid_attributes}, valid_session
        response.should redirect_to(ClientOther.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved client_other as @client_other" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClientOther.any_instance.stub(:save).and_return(false)
        post :create, {:client_other => {  }}, valid_session
        assigns(:client_other).should be_a_new(ClientOther)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClientOther.any_instance.stub(:save).and_return(false)
        post :create, {:client_other => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested client_other" do
        client_other = ClientOther.create! valid_attributes
        # Assuming there are no other client_others in the database, this
        # specifies that the ClientOther created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ClientOther.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => client_other.to_param, :client_other => { "these" => "params" }}, valid_session
      end

      it "assigns the requested client_other as @client_other" do
        client_other = ClientOther.create! valid_attributes
        put :update, {:id => client_other.to_param, :client_other => valid_attributes}, valid_session
        assigns(:client_other).should eq(client_other)
      end

      it "redirects to the client_other" do
        client_other = ClientOther.create! valid_attributes
        put :update, {:id => client_other.to_param, :client_other => valid_attributes}, valid_session
        response.should redirect_to(client_other)
      end
    end

    describe "with invalid params" do
      it "assigns the client_other as @client_other" do
        client_other = ClientOther.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClientOther.any_instance.stub(:save).and_return(false)
        put :update, {:id => client_other.to_param, :client_other => {  }}, valid_session
        assigns(:client_other).should eq(client_other)
      end

      it "re-renders the 'edit' template" do
        client_other = ClientOther.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClientOther.any_instance.stub(:save).and_return(false)
        put :update, {:id => client_other.to_param, :client_other => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested client_other" do
      client_other = ClientOther.create! valid_attributes
      expect {
        delete :destroy, {:id => client_other.to_param}, valid_session
      }.to change(ClientOther, :count).by(-1)
    end

    it "redirects to the client_others list" do
      client_other = ClientOther.create! valid_attributes
      delete :destroy, {:id => client_other.to_param}, valid_session
      response.should redirect_to(client_others_url)
    end
  end

end
