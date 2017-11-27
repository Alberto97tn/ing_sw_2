class AddFieldToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :invoice_number, :integer
    add_column :invoices, :amount, :float
    add_column :invoices, :vat, :float
    add_column :invoices, :hourly_cost, :float
  end
end
