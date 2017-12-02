# == Schema Information
#
# Table name: invoices
#
#  id             :integer          not null, primary key
#  date           :date
#  client_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  invoice_number :integer
#  amount         :float
#  vat            :float
#  hourly_cost    :float
#

FactoryBot.define do
  factory :invoice do
    date Date.current
    invoice_number 1
    amount 133.0
    vat 0.22
    hourly_cost 15
    client
  end
end
