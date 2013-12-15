json.extract! @activity
json.array!(@instances) do |instance|
  json.extract! instance, 
  json.url instance_url(instance, format: :json)
end
