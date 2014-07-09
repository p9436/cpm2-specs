# == Schema Information
# Schema version: 20140117141408
#
# Table name: promotions
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  import_url          :string(255)
#  last_import_status  :string(255)
#  imported_at         :datetime
#  website             :string(255)
#  parking_place_price :decimal(12, 2)   default(0.0)
#

require 'spec_helper'

describe Promotion do

  describe 'created' do
    before :all do
      @promotion = Fabricate :promotion
    end

    it { @promotion.valid?.should be_true }

    it 'should has a buildings' do
      @promotion.buildings.to_a.should_not be_empty
    end

    it 'should has a brokers' do
      @promotion.brokers.to_a.should_not be_empty
    end

    it 'should has a parking places' do
      @promotion.parking_places.should_not be_empty
    end

  end

  describe 'import from xml' do
    describe 'with fail' do
      before :all do
        @promotion = Promotion.new name: 'ImportTest', import_url: 'http://localhost/test.xml'
      end

      it 'should fail import and mark as not imported' do
        @promotion = Fabricate :promotion, import_url: 'http://localhost/test.xml'
        @promotion.imported_at.should be_nil
        @promotion.last_import_status.should_not eq('ok')
      end
    end

    describe 'with success' do
      before :each do
        @promotion = Promotion.new name: 'ImportTest', import_url: 'http://localhost/test.xml'
        @promotion.stub(:import)
        @promotion.stub(:get_xml).and_return(File.join(Rails.root, 'spec', 'fixtures', 'import_promotions.xml'))
        @promotion.save
        @promotion.import_from_xml!
      end
      it 'should be marked as ok' do
        @promotion.last_import_status.should eq('ok')
      end

      it 'should has buildings and lots' do
        @promotion.buildings.size.should eq(4)
        building = @promotion.buildings.where(name: 'D')
        building.size.should eq(1)
        building.first.lots.should_not be_empty
      end

      it 'should update promotion' do
        buildings_count_before_import = @promotion.buildings.size
        lots_count_before_import = @promotion.lots.size
        @promotion.stub(:get_xml).and_return(File.join(Rails.root, 'spec', 'fixtures', 'update_promotions.xml'))
        @promotion.import_from_xml!
        @promotion.last_import_status.should eq('ok')
        @promotion.buildings.size.should eq(buildings_count_before_import+1)
        @promotion.lots.size.should eq(lots_count_before_import+3)
      end

    end
  end



end
