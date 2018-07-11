json.extract! customer, :id, :TaxNumber, :Firstname, :Lastname, :Address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
