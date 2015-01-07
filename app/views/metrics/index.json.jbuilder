json.array!(@metrics) do |metric|
  json.extract! metric, :id, :name, :channel_id
  json.url metric_url(metric, format: :json)
end
