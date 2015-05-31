class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :phone
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :participants, :events
  end
end
