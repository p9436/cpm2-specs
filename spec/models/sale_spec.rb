# == Schema Information
# Schema version: 20140313092201
#
# Table name: sales
#
#  id                              :integer          not null, primary key
#  lot_id                          :integer          indexed
#  client_id                       :integer          indexed
#  broker_id                       :integer          indexed
#  referer_id                      :integer
#  optioned_at                     :datetime
#  reserved_at                     :datetime
#  thanks_reserved_at              :datetime
#  deposit_at                      :datetime
#  thanks_deposit_at               :datetime
#  ppe_at                          :datetime
#  sent_docs_at                    :datetime
#  signed_at                       :datetime
#  remise                          :integer
#  deposit                         :integer
#  created_at                      :datetime
#  updated_at                      :datetime
#  status_id                       :integer
#  signed                          :boolean          default(FALSE)
#  transferred_at                  :datetime
#  sale_type_id                    :integer
#  expected_signature_at           :date
#  expected_agreement_signature_at :date
#  agreement_signed_at             :date
#  condition_precedent             :boolean          default(FALSE)
#  last_status_date                :date
#

require 'spec_helper'


describe Sale do

  before :each do
    Sale.destroy_all
    @sale = Fabricate :sale, reserved_at: Time.now
  end

  it { @sale.valid?.should be_true }

  it 'should return total revenue of sale' do
    @sale.lot = Fabricate(:lot, price: 10000)
    @sale.parking_places << Fabricate(:parking_place, price: 2000)
    expect(@sale.revenue).to eq(12000)
  end

  describe 'Scopes' do
    before :each do
      @sold_sale = Fabricate :sale, signed: true, signed_at: Time.now
    end
    it 'should return only in-progress sales' do
      Sale.all.size.should eq(2)
      Sale.in_progress.should eq([@sale])
    end
    it 'should return only sold sales' do
      Sale.all.size.should eq(2)
      Sale.sold.should eq([@sold_sale])
    end

    it "should return sold sale in determined period" do
      another_sold_sale = Fabricate :sale, signed: true, signed_at: Time.now - 1.month
      Sale.all.size.should eq(3)
      Sale.sold.period(Date.today-1.week, Date.today+1.week).should eq([@sold_sale])
    end
  end

  describe 'update Lot status' do
    before :each do
      @sale = Fabricate :sale
    end
    it 'should has unchanged status' do
      expect(@sale.status_id).to be_nil
      expect(@sale.lot.status).to be_nil
    end
    it 'should change lot status as reserved' do
      @sale.update_attribute :reserved_at, Time.now
      expect(@sale.status_id).to eq(Sale::SALE_STATUSES.index(:reserved_at))
      expect(@sale.lot.reload.status).to eq(Lot::STATUSES.index(:reserved))
      @sale.update_attribute :deposit_at, Time.now
      expect(@sale.status_id).to eq(Sale::SALE_STATUSES.index(:deposit_at))
      expect(@sale.lot.reload.status).to eq(Lot::STATUSES.index(:reserved))
    end
    it 'should change lot status as sold' do
      @sale.update_attribute :signed, true
      expect(@sale.lot.reload.status).to eq(Lot::STATUSES.index(:sold))
    end
  end


  describe 'update parking places' do
    before :each do
      Fabricate :parking_place, name: 1
      Fabricate :parking_place, name: 2
      Fabricate :parking_place, name: 3, sale_id: 100

      @sale = Fabricate :sale, lot: nil
    end
    it 'should be valid' do
      expect(@sale.valid?).to eql(true)
    end
    it 'should accept parking places' do
      @sale.parking_places_names = '1,2'
      expect(@sale.valid?).to eql(false)
      expect(@sale.errors.full_messages.first[/Select Lot first/].present?).to eq(true)

      @sale.lot = Fabricate :lot
      expect(@sale.valid?).to eql(true)

      @sale.parking_places_names = '1,2,3'
      expect(@sale.valid?).to eql(false)
      expect(@sale.errors.full_messages.first[/3 is not available/].present?).to eq(true)

      @sale.parking_places_names = '1,2,4'
      expect(@sale.valid?).to eql(false)
      expect(@sale.errors.full_messages.first[/4 is not exists/].present?).to eq(true)

      @sale.parking_places_names = '1,2'
      expect(@sale.valid?).to eql(true)

      @sale.save
      expect(@sale.parking_places_names).to eq('1, 2')
    end


  end

end
