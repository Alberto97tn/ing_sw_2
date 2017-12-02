# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  hours       :integer
#  description :string
#  client_id   :integer
#  invoice_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :report do
    sequence(:hours) { |n| n}
    sequence(:description) { |n| "Test_hello#{n}"}
    client
  end
end
