# == Schema Information
# Schema version: 20130725105759
#
# Table name: referers
#
#  id                :integer          not null, primary key
#  name              :string(120)
#  surname           :string(120)
#  comission_percent :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Referer do
  it {Fabricate(:referer).valid?.should be_true }
end
