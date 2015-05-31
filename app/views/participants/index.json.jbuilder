json.array!(@participants) do |participant|
  json.extract! participant, :id, :phone, :event_id
  json.url participant_url(participant, format: :json)
end
