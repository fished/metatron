class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.inet :address
      t.boolean :primary, default: false
      t.integer :node_id

      t.timestamps null: false
    end
    add_foreign_key :addresses, :nodes
  end
end
