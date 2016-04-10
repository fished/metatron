json.array!(@nodes) do |node|
  json.extract! node, :id, :hostname, :comments, :properties
  json.url node_url(node, format: :json)
end
