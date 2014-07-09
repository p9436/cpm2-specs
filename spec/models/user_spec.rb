# == Schema Information
# Schema version: 20130716120131
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null, indexed
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)      indexed
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  
  before :all do
    @user = Fabricate :user
  end

  it { @user.valid?.should be_true }


  it 'should has assigned broker' do
    @user.broker = Fabricate :broker
    @user.broker.should_not be_nil
    @user.broker?.should be_true
  end


end
