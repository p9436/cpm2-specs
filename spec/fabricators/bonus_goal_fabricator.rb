# == Schema Information
# Schema version: 20130819083457
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  broker_id  :integer          indexed
#  start_at   :date
#  end_at     :date
#  turnover   :integer          default(0)
#  target     :integer          default(0)
#  reward     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

Fabricator :bonus_goal do |variable|
  broker
  target     2
  turnover   200000
  start_at   '01.03.2013'
  end_at     '31.03.2013'
  reward     1000
end
