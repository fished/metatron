class AddAssociationFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :network_id, :integer
    add_column :properties, :group_id, :integer
  end
end
