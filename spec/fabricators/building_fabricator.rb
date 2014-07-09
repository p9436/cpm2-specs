# == Schema Information
# Schema version: 20130726112845
#
# Table name: buildings
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  promotion_id :integer
#

Fabricator(:building) do
  name      { Faker::Name.first_name }
  floors(count: 1) { Fabricate(:floor) }
end
