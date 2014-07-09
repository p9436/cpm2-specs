require 'spec_helper'

describe Api::ClientsController do

  before :each do
    Client.stub(:api_tokens).and_return({'validtoken'=>'wp1'})
    @valid_client_attributes = { name: 'Jamison',
                                 surname: 'Wood',
                                 comment: 'Comment here',
                                 contact_source_url: "hhtp://example.com",
                                 contact_attributes: {
                                   email: 'jamison@test.com',
                                   phone1: '555-55-55',
                                 },
                                optional_fields: {
                                  field1: 'field1data'
                                },

                               }

  end

  describe "authorization by api_token" do
    it 'should be valid' do
      request.stub(:referer).and_return('http://example.com')
      Client.stub(:api_tokens).and_return({'validtoken'=>'wp1'})
      post :create, format: :json, api_token: 'validtoken', client: @valid_client_attributes
      expect(response.status).to eq(201)
      assigns(:client).contact_source.should eq([:internal_site])
    end

    it 'should be valid' do
      post :create, format: :json, api_token: 'invalidtoken', client: @valid_client_attributes
      expect(response.status).to eq(401)
    end

  end


end
