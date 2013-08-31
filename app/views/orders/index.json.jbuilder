json.array!(@orders) do |order|
  json.extract! order, :content
  json.url order_url(order, format: :json)
end
