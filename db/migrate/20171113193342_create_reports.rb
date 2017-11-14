class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :hours
      t.string :description
      t.integer :client_id
      t.integer :invoice_id

      t.timestamps
    end
  end
end
