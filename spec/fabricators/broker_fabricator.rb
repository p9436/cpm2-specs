# == Schema Information
# Schema version: 20130726084724
#
# Table name: brokers
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string(120)
#  surname           :string(120)
#  comission_percent :integer
#  salary            :integer
#  avs_nunber        :integer
#  created_at        :datetime
#  updated_at        :datetime
#


Fabricator(:broker) do
  name       { Faker::Name.name }
  contact
end
