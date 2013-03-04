class AddItemNameIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :itemname_id, :integer
  end
end
