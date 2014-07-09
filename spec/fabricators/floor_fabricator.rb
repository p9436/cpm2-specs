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

Fabricator(:floor) do
  name '1'
  lots(count: 1) { Fabricate(:lot) }
end
