# == Schema Information
# Schema version: 20140306155408
#
# Table name: lots
#
#  id                          :integer          not null, primary key
#  name                        :string(255)      indexed, indexed => [promotion_id]
#  lot_type_id                 :integer
#  entry                       :string(10)
#  floor_id                    :integer          indexed
#  orientation                 :string(80)
#  pieces_count                :integer
#  surface_habitable           :decimal(6, 2)
#  surface_balcony             :decimal(6, 2)
#  surface_terrace             :decimal(6, 2)
#  surface_garden              :decimal(6, 2)
#  created_at                  :datetime
#  updated_at                  :datetime
#  price                       :decimal(12, 2)
#  status                      :integer
#  plan_reserved_file_name     :string(255)
#  plan_reserved_content_type  :string(255)
#  plan_reserved_file_size     :integer
#  plan_reserved_updated_at    :datetime
#  plan_sold_file_name         :string(255)
#  plan_sold_content_type      :string(255)
#  plan_sold_file_size         :integer
#  plan_sold_updated_at        :datetime
#  weighted_surface            :decimal(6, 2)
#  garden_cost                 :decimal(12, 2)
#  default_parking_places      :string(120)
#  plan_available_file_name    :string(255)
#  plan_available_content_type :string(255)
#  plan_available_file_size    :integer
#  plan_available_updated_at   :datetime
#  promotion_id                :integer          indexed => [name]
#

# spec/fabricators/lot_fabricator.rb

Fabricator(:lot) do
  name               'A-15'
  entry              'A'
  orientation        'West'
  surface_habitable  120.5
  surface_balcony    30
  surface_garden     40
  surface_terrace    16
  lot_type_id        0
end
