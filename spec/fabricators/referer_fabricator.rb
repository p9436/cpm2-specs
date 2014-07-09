# == Schema Information
# Schema version: 20130725105759
#
# Table name: referers
#
#  id                :integer          not null, primary key
#  name              :string(120)
#  surname           :string(120)
#  comission_percent :integer
#  created_at        :datetime
#  updated_at        :datetime
#

# spec/fabricators/business_bringer_fabricator.rb

Fabricator(:referer) do
  name       { Faker::Name.first_name }
  surname    { Faker::Name.last_name }
  comission_percent 20
  contact
end
