json.array!(@kpis) do |kpi|
  json.extract! kpi, :id, :title, :description, :weighting, :baseline, :target
  json.url kpi_url(kpi, format: :json)
end
