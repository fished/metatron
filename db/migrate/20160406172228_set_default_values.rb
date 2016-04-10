class SetDefaultValues < ActiveRecord::Migration
  def change
    change_column_default :addresses, :primary, false
  end
end
