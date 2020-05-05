class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    User.create! do |u|
      u.email = "superadmin@gmail.com"
      u.password = "superadmin123"
      u.role = "superadmin"
      u.username = "superadmin"
    end
  end
end
