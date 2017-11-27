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

class Invoice < ApplicationRecord
  has_many :reports
  belongs_to :client
  validates :date, :client_id, :invoice_number, :amount, :vat, :hourly_cost, presence: true


  attr_accessor :reports_ids

end
