class RenameAttributesToProperties < ActiveRecord::Migration
  def change
    rename_column :nodes, :attributes, :properties
  end
end
