class CreateItemnames < ActiveRecord::Migration
  def change
    create_table :itemnames do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
