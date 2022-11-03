class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address, default: 2, null: false
      t.integer :role
      t.boolean :is_active
      t.string :password_digest

      t.timestamps
    end
  end
end
