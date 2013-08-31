class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :menu_link
      t.string :home_link
      t.string :day

      t.timestamps
    end
  end
end
