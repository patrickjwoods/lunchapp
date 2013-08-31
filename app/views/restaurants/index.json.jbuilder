json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :menu_link, :home_link, :day
  json.url restaurant_url(restaurant, format: :json)
end
