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

class Client < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :invoices

  def full_name
    "#{name} #{surname}"
  end

end
