class AddStarsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :stars, :integer
  end
end
