require 'spec_helper'

describe GoalsController do
  login_superadmin
  render_views


  before :all do
    @broker = Fabricate :broker
  end

  describe 'BonusGoals' do
    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new, :broker_id => @broker.id, :goal_type => 'bonus'
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('new')
        assigns(:goal).class.should eq(BonusGoal)
        assigns(:goal).broker.should eq(@broker)
      end
    end

    describe "GET #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, bonus_goal: { start_at: '01.08.2013', end_at: '31.08.2013',  }, :broker_id => @broker.id, goal_type: 'bonus'
        expect(response).to be_redirect
        expect(response.status).to eq(302)
        assigns(:goal).class.should eq(BonusGoal)
        assigns(:goal).broker.should eq(@broker)
      end
    end

  end

  describe 'AnnualGoals' do
    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new, :broker_id => @broker.id, :goal_type => 'annual'
        expect(response).to be_success
        expect(response.status).to eq(200)
        response.should render_template('new')
        assigns(:goal).class.should eq(AnnualGoal)
        assigns(:goal).broker.should eq(@broker)
      end
    end
    describe "GET #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, annual_goal: { year: '2013',  }, :broker_id => @broker.id, goal_type: 'annual'
        assigns(:goal).class.should eq(AnnualGoal)
        assigns(:goal).broker.should eq(@broker)
        assigns(:goal).year.should eq(2013)
        expect(response).to be_redirect
        expect(response.status).to eq(302)
      end
    end
  end
end
