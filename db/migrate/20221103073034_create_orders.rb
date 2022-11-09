class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.float :total_of_money
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
