class CreateRayons < ActiveRecord::Migration[5.2]
  def change
    create_table :rayons do |t|
      t.string :name

      t.timestamps
    end
  end
end
