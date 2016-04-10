json.array!(@networks) do |network|
  json.extract! network, :id, :address, :description, :parent_id
  json.url network_url(network, format: :json)
end
