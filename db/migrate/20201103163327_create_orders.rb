class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :final_number
      t.numeric :total
      t.integer :status

      t.timestamps
    end
  end
end
