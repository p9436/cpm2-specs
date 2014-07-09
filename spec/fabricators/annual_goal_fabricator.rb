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

Fabricator :annual_goal do |variable|
  broker
  target     10
  turnover   1000000
end
