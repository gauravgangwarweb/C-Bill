json.extract! debt, :id, :amount, :user_id, :customer_id, :created_at, :updated_at
json.url debt_url(debt, format: :json)
