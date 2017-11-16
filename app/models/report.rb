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

class Report < ApplicationRecord
  belongs_to :client
  belongs_to :inovice, optional: true

  validates :hours, presence: true, numericality: {greater_then: 0}
  validates :description, presence: true
  validates :client_id, presence: true

  def unbilled?
    !invoice_id.nil?
  end
end
