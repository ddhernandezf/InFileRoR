json.extract! product, :id, :Name, :CurrentPrice, :created_at, :updated_at
json.url product_url(product, format: :json)
