class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.text :name
      t.text :comments
      t.jsonb :properties

      t.timestamps null: false
    end
  end
end
