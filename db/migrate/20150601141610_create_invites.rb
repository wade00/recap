class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :event, index: true
      t.references :participant, index: true

      t.timestamps null: false
    end
    add_foreign_key :invites, :events
    add_foreign_key :invites, :participants
  end
end
