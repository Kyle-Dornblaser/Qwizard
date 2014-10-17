class CreateDifficulties < ActiveRecord::Migration
  def change
    create_table :difficulties do |t|
      t.integer :points

      t.timestamps
    end
  end
end
