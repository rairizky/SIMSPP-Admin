class CreateSiswas < ActiveRecord::Migration[5.2]
  def change
    create_table :siswas do |t|
      t.integer :nis
      t.string :nama
      t.string :rombel
      t.string :rayon

      t.timestamps
    end
  end
end
