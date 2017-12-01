json.array!(@reports) do |report|
  json.id report.id
  json.text report.description
  json.hours report.hours
end
