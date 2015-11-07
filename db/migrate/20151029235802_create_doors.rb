class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :title
      t.text :description
      t.boolean :is_open, default: false

      t.timestamps null: false
    end
  end
end
