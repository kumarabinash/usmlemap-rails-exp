json.array!(@markers) do |marker|
  json.extract! marker, :id, :marker_type, :marker_content, :lat, :lat, :lng, :lng
  json.url marker_url(marker, format: :json)
end
