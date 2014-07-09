# == Schema Information
# Schema version: 20130725114038
#
# Table name: interactions
#
#  id                  :integer          not null, primary key
#  client_id           :integer
#  broker_id           :integer
#  date                :date
#  comment             :text
#  interaction_type_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

# spec/fabricators/interaction_fabricator.rb

Fabricator(:interaction) do
  # client
  # broker
  date                 { Time.now }
  comment              { Faker::Lorem.paragraph }
  interaction_type_id  1
end
