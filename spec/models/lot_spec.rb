# == Schema Information
# Schema version: 20140306155408
#
# Table name: lots
#
#  id                          :integer          not null, primary key
#  name                        :string(255)      indexed, indexed => [promotion_id]
#  lot_type_id                 :integer
#  entry                       :string(10)
#  floor_id                    :integer          indexed
#  orientation                 :string(80)
#  pieces_count                :integer
#  surface_habitable           :decimal(6, 2)
#  surface_balcony             :decimal(6, 2)
#  surface_terrace             :decimal(6, 2)
#  surface_garden              :decimal(6, 2)
#  created_at                  :datetime
#  updated_at                  :datetime
#  price                       :decimal(12, 2)
#  status                      :integer
#  plan_reserved_file_name     :string(255)
#  plan_reserved_content_type  :string(255)
#  plan_reserved_file_size     :integer
#  plan_reserved_updated_at    :datetime
#  plan_sold_file_name         :string(255)
#  plan_sold_content_type      :string(255)
#  plan_sold_file_size         :integer
#  plan_sold_updated_at        :datetime
#  weighted_surface            :decimal(6, 2)
#  garden_cost                 :decimal(12, 2)
#  default_parking_places      :string(120)
#  plan_available_file_name    :string(255)
#  plan_available_content_type :string(255)
#  plan_available_file_size    :integer
#  plan_available_updated_at   :datetime
#  promotion_id                :integer          indexed => [name]
#

require 'spec_helper'

describe Lot do

  before :all do
    @lot = Fabricate :lot
  end

  it {@lot.valid?.should be_true}


  describe 'Statuses' do
    it 'should be reserved' do
      @sale = Fabricate :sale, reserved_at: Time.now
      @lot = @sale.lot
      @sale.status_id.should eq(1)
      @lot.reserved?.should be_true
    end

    it 'should be sold' do
      @sale = Fabricate :sale, signed: true
      @lot = @sale.lot
      @lot.sold?.should be_true
    end

    it 'should be available' do
      @lot.available?.should be_true
      @lot.reserved?.should be_false
      @lot.sold?.should be_false
    end
  end

  describe 'Scopes' do
    it 'should return only available lots' do
      available_lot = Fabricate :lot, status: 0
      Lot.available.should include(available_lot)
    end
    it 'excludes not available lots' do
      not_available_lot = Fabricate :lot, status: 1
      Lot.available.should_not include(not_available_lot)
    end
  end

  describe 'Square meter price' do
    it "counts price per square meter by deviding price on weighted_surface" do
      lot = Fabricate :lot, price: 150000, weighted_surface: 50

      lot.square_meter_price.should == (lot.price / lot.weighted_surface)
    end
  end

end
