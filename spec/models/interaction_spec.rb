# == Schema Information
# Schema version: 20130725114038
#
# Table name: interactions
#
#  id                  :integer          not null, primary key
#  client_id           :integer
#  broker_id           :integer
#  date                :date
#  comment             :text
#  interaction_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Interaction do
  it { Fabricate(:interaction).valid?.should be_true }
end
