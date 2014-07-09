# == Schema Information
# Schema version: 20140110154830
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  phone1           :string(40)
#  phone2           :string(40)
#  address1         :string(255)
#  address2         :string(255)
#  postal_code      :string(40)
#  city             :string(40)
#  country          :string(2)
#  created_at       :datetime
#  updated_at       :datetime
#  contactable_id   :integer          indexed => [contactable_type]
#  contactable_type :string(255)      indexed => [contactable_id]
#  phone3           :string(40)
#


Fabricator(:contact) do
  email      { Faker::Internet.email }
  phone1     { Faker::PhoneNumber.cell_phone }
  city       { Faker::Address.city }
  country    "eu"
  address1   "Lorem ipsum Excepteur commodo irure do labore anim."
  address2   "Lorem ipsum Excepteur commodo irure do labore anim."
end
