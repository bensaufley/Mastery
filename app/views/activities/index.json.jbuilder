json.array!(@activities) do |activity|
  json.extract! activity, :name, :type, :private
  json.url activity_url(activity, format: :json)
end
