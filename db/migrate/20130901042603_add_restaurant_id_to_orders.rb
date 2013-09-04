class AddRestaurantIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :restaurant_id, :integer
    add_index :orders, :restaurant_id
  end
end
