# == Schema Information
# Schema version: 20140313082627
#
# Table name: clients
#
#  id                        :integer          not null, primary key
#  name                      :string(120)
#  surname                   :string(120)
#  contact_method_id         :integer
#  budget_range_id           :integer
#  language                  :string(2)
#  comment                   :text
#  created_at                :datetime
#  updated_at                :datetime
#  broker_id                 :integer          indexed
#  type_of_real_estate       :string(255)      default([])
#  source_id                 :integer
#  vip                       :boolean
#  contact_source_url        :string(255)
#  contact_source_old        :string(255)      default([])
#  deleted_at                :datetime
#  client_type               :string(255)      default([])
#  contact_source            :string(60)
#  contact_status            :integer          default(0), indexed, indexed => [first_interaction_type_id]
#  first_interaction_type_id :integer          indexed => [contact_status]
#

# spec/fabricators/client_fabricator.rb

Fabricator(:client) do
  name                  { Faker::Name.first_name }
  surname               { Faker::Name.last_name }
  language              "uk"
  comment               { Faker::Lorem.paragraph }
  contact
  contact_source        Client::CONTACT_SOURCES.first
  type_of_real_estate   TypeOfRealEstate::TYPES.first
  budget_range_id       BudgetRange::RANGES.first
end

