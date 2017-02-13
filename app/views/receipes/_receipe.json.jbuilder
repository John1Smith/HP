json.extract! receipe, :id, :name, :desc, :created_at, :updated_at
json.url receipe_url(receipe, format: :json)