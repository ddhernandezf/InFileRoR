json.extract! invoice_header, :id, :State, :Customer, :InvoiceDateTime, :created_at, :updated_at
json.url invoice_header_url(invoice_header, format: :json)
