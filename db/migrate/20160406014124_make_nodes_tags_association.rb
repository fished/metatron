class MakeNodesTagsAssociation < ActiveRecord::Migration
  def change
    create_table :nodes_tags do |t|
      t.integer :node_id
      t.integer :tag_id
    end

    add_foreign_key :nodes_tags, :nodes
    add_foreign_key :nodes_tags, :tags
  end
end
