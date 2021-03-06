class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.string :email
      t.string :avatar
      t.string :role

      t.timestamps
    end
  end
end
