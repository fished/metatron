class ChangeNodeNameToHostname < ActiveRecord::Migration
  def change
    rename_column :nodes, :name, :hostname
  end
end
