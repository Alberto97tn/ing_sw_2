class AddFieldToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :company_name, :string
    add_column :clients, :vat_number, :string
    add_column :clients, :address, :string
  end
end
