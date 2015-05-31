class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :reminder_interval
      t.datetime :recap_alert_time
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
