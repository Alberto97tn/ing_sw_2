# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  date       :date
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invoice < ApplicationRecord
  has_many :reports
  belongs_to :client
  validates :date, presence: true
  validates :date, presence: true
end
