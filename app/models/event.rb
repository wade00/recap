class Event < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates :name, :start_time, :end_time, :reminder_interval, :recap_alert_time, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
