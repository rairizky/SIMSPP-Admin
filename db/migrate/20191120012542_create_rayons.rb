class CreateRayons < ActiveRecord::Migration[5.2]
  def change
    create_table :rayons do |t|
      t.string :nama_rayon

      t.timestamps
    end
  end
end
