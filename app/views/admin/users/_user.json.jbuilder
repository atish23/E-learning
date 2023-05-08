json.extract! user, :id, :name, :phone_number, :email, :password, :role_id, :created_at, :updated_at
json.url user_url(user, format: :json)
