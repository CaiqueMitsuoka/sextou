json.extract! user, :id, :name, :user_raw, :online, :session_id, :created_at, :updated_at
json.url user_url(user, format: :json)