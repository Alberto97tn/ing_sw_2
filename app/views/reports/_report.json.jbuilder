json.extract! report, :id, :hours, :description, :client_id, :invoice_id, :created_at, :updated_at
json.url report_url(report, format: :json)
