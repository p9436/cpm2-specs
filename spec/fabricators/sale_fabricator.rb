# == Schema Information
# Schema version: 20140313092201
#
# Table name: sales
#
#  id                              :integer          not null, primary key
#  lot_id                          :integer          indexed
#  client_id                       :integer          indexed
#  broker_id                       :integer          indexed
#  referer_id                      :integer
#  optioned_at                     :datetime
#  reserved_at                     :datetime
#  thanks_reserved_at              :datetime
#  deposit_at                      :datetime
#  thanks_deposit_at               :datetime
#  ppe_at                          :datetime
#  sent_docs_at                    :datetime
#  signed_at                       :datetime
#  remise                          :integer
#  deposit                         :integer
#  created_at                      :datetime
#  updated_at                      :datetime
#  status_id                       :integer
#  signed                          :boolean          default(FALSE)
#  transferred_at                  :datetime
#  sale_type_id                    :integer
#  expected_signature_at           :date
#  expected_agreement_signature_at :date
#  agreement_signed_at             :date
#  condition_precedent             :boolean          default(FALSE)
#  last_status_date                :date
#


Fabricator(:sale) do
  lot
  client
end
