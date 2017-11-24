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
#

class Client < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :invoices

  def fullname
    "#{name} #{surname}"
  end

end
