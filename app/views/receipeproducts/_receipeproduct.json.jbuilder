json.extract! receipeproduct, :id, :product_id, :receipe_id, :quantity, :created_at, :updated_at
json.url receipeproduct_url(receipeproduct, format: :json)