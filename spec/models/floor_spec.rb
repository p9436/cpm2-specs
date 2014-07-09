# == Schema Information
# Schema version: 20131009092825
#
# Table name: floors
#
#  id                :integer          not null, primary key
#  name              :string(20)
#  building_id       :integer          indexed
#  created_at        :datetime
#  updated_at        :datetime
#  plan_file_name    :string(255)
#  plan_content_type :string(255)
#  plan_file_size    :integer
#  plan_updated_at   :datetime
#  position          :integer
#

require 'spec_helper'

describe Floor do

  before :each do
    @floor = Fabricate :floor
  end
  it {@floor.valid?.should be_true }

end
