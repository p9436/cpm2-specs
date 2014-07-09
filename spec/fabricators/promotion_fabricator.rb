# == Schema Information
# Schema version: 20140117141408
#
# Table name: promotions
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  import_url          :string(255)
#  last_import_status  :string(255)
#  imported_at         :datetime
#  website             :string(255)
#  parking_place_price :decimal(12, 2)   default(0.0)
#

Fabricator(:promotion) do
  name                     { Faker::Name.first_name.to_s << "'s Garden" }
  buildings(count: 1)      { Fabricate(:building) }
  brokers(count: 1)        { Fabricate(:broker) }
  parking_places(count: 1) { |attrs, i| Fabricate :parking_place, name:"p-#{i}" }
end
