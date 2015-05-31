json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :image_file_name, :start_time, :end_time, :reminder_interval, :recap_alert_time, :user_id
  json.url event_url(event, format: :json)
end
