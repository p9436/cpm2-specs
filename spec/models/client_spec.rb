# == Schema Information
# Schema version: 20140313082627
#
# Table name: clients
#
#  id                        :integer          not null, primary key
#  name                      :string(120)
#  surname                   :string(120)
#  contact_method_id         :integer
#  budget_range_id           :integer
#  language                  :string(2)
#  comment                   :text
#  created_at                :datetime
#  updated_at                :datetime
#  broker_id                 :integer          indexed
#  type_of_real_estate       :string(255)      default([])
#  source_id                 :integer
#  vip                       :boolean
#  contact_source_url        :string(255)
#  contact_source_old        :string(255)      default([])
#  deleted_at                :datetime
#  client_type               :string(255)      default([])
#  contact_source            :string(60)
#  contact_status            :integer          default(0), indexed, indexed => [first_interaction_type_id]
#  first_interaction_type_id :integer          indexed => [contact_status]
#

require 'spec_helper'

describe Client do

  before :each do
    @client = Fabricate(:client)
  end


  it 'should be valid record' do
    @client.valid?.should be_true
  end

  it 'should has a full_name' do
    @client.full_name.should eq(@client.name.to_s<<' '<<@client.surname)
  end

  describe "Contact sources" do
    it "should save record without 'Internal site' source" do
      @client.contact_source = [:relation, :sales_panel, :mailing]
      @client.contact_source_url_required?.should be_false
      @client.save.should be_true
    end

    it "should not save record with 'Internal site' source and no url" do
      @client.contact_source = [:relation, :sales_panel, :mailing, :internal_site]
      @client.contact_source_url_required?.should be_true
      @client.save.should be_false
    end

    it "should save record with 'Internal site' if 'contact_source_url' is present" do
      @client.contact_source = [:mailing, :internal_site]
      @client.contact_source_url = "http://example.com"
      @client.contact_source_url_required?.should be_true
      @client.save.should be_true
    end

    it "should set url" do
      @client.contact_source = [:mailing]
      @client.set_source_internal "http://example.com"
      @client.contact_source.size.should == 2
    end

  end

  describe 'Scopes' do
    before :each do
      @other_client = Fabricate :client
      @other_client.update_attribute :created_at, '10.10.2012'
      @client.update_attribute :created_at, '10.08.2013'
    end
    it 'should return client created during determined period' do
      expect(Client.period('01.10.2012','31.10.2012').size).to eq(1)
    end
  end

end
