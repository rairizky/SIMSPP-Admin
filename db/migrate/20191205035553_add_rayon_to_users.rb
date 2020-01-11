class AddRayonToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rayon, :string
  end
end
