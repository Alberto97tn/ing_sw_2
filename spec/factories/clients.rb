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
  factory :client do
    name "Adolfo " + random_string.to_s
    surname "Villafiorita"
    email "test@test.com"
    company_name "FBK"
    vat_number "12234323432"
    address "Via vsqdsadsfasda"
  end
end

