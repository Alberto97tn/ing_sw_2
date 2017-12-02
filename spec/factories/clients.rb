# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  name         :string
#  surname      :string
#  email        :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_name :string
#  vat_number   :string
#  address      :string
#

FactoryBot.define do
  factory :client do |client|
    sequence(:name) {|n| "Adolfo#{n}"}
    sequence(:surname) {|n| "Villafiorita#{n}"}
    sequence(:email) {|n| "test@test.com#{n}"}
    sequence(:company_name) {|n| "FBK#{n}"}
    sequence(:vat_number) {|n| "12234323432#{n}"}
    sequence(:address) {|n| "Via vsqdsadsfasda#{n}"}
  end
end

