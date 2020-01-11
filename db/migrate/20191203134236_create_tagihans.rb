class CreateTagihans < ActiveRecord::Migration[5.2]
  def change
    create_table :tagihans do |t|
      t.integer :nis, unique: true
      t.string :nama
      t.string :kelas
      t.string :rayon
      t.integer :tagihan

      t.timestamps
    end
  end
end
