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

require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
