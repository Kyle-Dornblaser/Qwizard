class AddSaltToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :salt, :string
  end
end
