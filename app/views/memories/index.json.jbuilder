json.array!(@memories) do |memory|
  json.extract! memory, :id, :image_file_name,, :description, :event_id
  json.url memory_url(memory, format: :json)
end
