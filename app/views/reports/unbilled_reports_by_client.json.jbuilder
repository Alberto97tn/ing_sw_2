json.array!(@reports) do |report|
  json.id report.id
  json.text report.description
  #json.url section_url(section, format: :json)
end
