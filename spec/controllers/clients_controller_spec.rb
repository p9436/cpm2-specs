require 'spec_helper'

describe ClientsController do

  describe 'as broker' do
    login_broker

    describe "POST #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, :client => { :name => 'Jamison', :surname => 'Wood',
                                   :contact_attributes => { :email => 'jamison@test.com',
                                                            :phone1 => '555-55-55' } }
        expect(Client.last.broker).to eq(@current_user.broker)
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end
  end


  describe 'as superadmin' do
    login_superadmin
    render_views

    before :all do
      Client.destroy_all
      @client = Fabricate :client, vip: true, type_of_real_estate: ['1', '2'], budget_range_id: 3, language: 2
    end


    describe 'GET filtered client list' do
      before :all do
        @other_client = Fabricate :client
      end
      describe "should filter clients" do
        it "by promotion" do
          promotion = Fabricate :promotion
          sale = Fabricate :sale, client: @client, lot: promotion.buildings.first.lots.first, deposit_at: Time.now
          get :index, :filter => { :promotion_id => sale.lot.promotion.id }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)
        end

        it "by sale status" do
          promotion = Fabricate :promotion
          sale = Fabricate :sale, client: @client, lot: promotion.buildings.first.lots.first, status_id: 3
          get :index, :filter => { :sale_status_id => '3' }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)
        end

        it "by vip" do
          get :index, :filter => { :vip => '1' }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)
        end

        it "by type of real estate" do
          get :index, :filter => { :type_of_real_estate_ids => ['2','3'] }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)

          get :index, :filter => { :type_of_real_estate_ids => ['3','4'] }
          assigns(:clients).should be_empty
        end

        it "by budget range" do
          get :index, :filter => { :budget_range_id => '3' }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)
        end

        it "by language" do
          get :index, :filter => { :language => '2' }
          assigns(:clients).size.should eq(1)
          assigns(:clients).should include(@client)
          assigns(:clients).should_not include(@other_client)
        end

      end
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
        get :show, :id => @client.id
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
        get :edit, :id => @client.id
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('edit')
      end
    end


    describe "POST #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, :client => { :name => 'Jamison',
                                   :surname => 'Wood',
                                   :contact_attributes => { :email => 'jamison@test.com',
                                                            :phone1 => '555-55-55' },
                                   :type_of_real_estate => ['1', '2'],
                                   :budget_range_id => '3' }

        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end


    describe "PUT #update" do
      it "responds successfully with an HTTP 302 status code" do
        put :update, :id => @client.id, :client => { :name => 'Jamison' }
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end


    describe "DELETE #destroy" do
      it "responds successfully with an HTTP 302 status code" do
        delete :destroy, :id => @client.id
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end
  end

end
