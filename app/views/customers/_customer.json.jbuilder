json.extract! customer, :id, :name, :pic, :address, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
