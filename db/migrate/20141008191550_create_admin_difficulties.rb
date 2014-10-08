class CreateAdminDifficulties < ActiveRecord::Migration
  def change
    create_table :admin_difficulties do |t|
      t.integer :points

      t.timestamps
    end
  end
end
