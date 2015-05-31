class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.text :description
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :memories, :events
  end
end
