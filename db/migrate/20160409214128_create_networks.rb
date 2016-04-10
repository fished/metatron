class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.cidr :address
      t.text :description
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
