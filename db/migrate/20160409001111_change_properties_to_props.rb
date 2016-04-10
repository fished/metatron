class ChangePropertiesToProps < ActiveRecord::Migration
  def change
    remove_column :nodes, :properties
    add_column :nodes, :props, :hstore
  end
end
