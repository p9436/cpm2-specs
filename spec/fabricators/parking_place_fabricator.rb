# == Schema Information
# Schema version: 20131122103355
#
# Table name: parking_places
#
#  id           :integer          not null, primary key
#  name         :string(255)      indexed => [promotion_id]
#  promotion_id :integer          indexed => [name]
#  sale_id      :integer
#  price        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# spec/fabricators/parking_place_fabricator.rb

Fabricator(:parking_place) do
  name "p-35"
end
