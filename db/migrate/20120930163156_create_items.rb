class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.boolean :base
      t.boolean :seal
      t.boolean :shard
      t.boolean :scroll
      t.references :user

      t.timestamps
    end
    add_index :items, :user_id
  end
end
