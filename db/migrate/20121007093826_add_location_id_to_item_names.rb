class AddLocationIdToItemNames < ActiveRecord::Migration
  def change
    add_column :itemnames, :location_id, :integer
  end
end
