class RenameAddressesTable < ActiveRecord::Migration
  def change
    rename_table :node_addresses, :addresses
  end
end
