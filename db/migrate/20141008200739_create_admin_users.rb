class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :avatar
      t.string :role

      t.timestamps
    end
  end
end
