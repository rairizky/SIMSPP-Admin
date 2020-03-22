class CreateTagihans < ActiveRecord::Migration[5.2]
  def change
    create_table :tagihans do |t|
      t.integer :nis
      t.string :nama
      t.string :rombel
      t.string :rayon
      t.integer :tagihan
      t.string :no_whatsapp

      t.timestamps
    end
  end
end
