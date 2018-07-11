json.extract! invoice_detail, :id, :Header, :Product, :Quantity, :Price, :created_at, :updated_at
json.url invoice_detail_url(invoice_detail, format: :json)
