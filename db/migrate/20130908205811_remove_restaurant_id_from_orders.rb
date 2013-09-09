class RemoveRestaurantIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :restaurant_id, :integer
  end
end
