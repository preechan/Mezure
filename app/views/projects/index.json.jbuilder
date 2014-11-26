json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :startdate, :enddate, :status
  json.url project_url(project, format: :json)
end
