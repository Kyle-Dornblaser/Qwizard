class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :username
      t.string :password
      t.string :email
      t.string :avatar

      t.timestamps
    end
  end
end
