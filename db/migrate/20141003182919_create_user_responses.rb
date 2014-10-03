class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.references :user, index: true
      t.references :questioninstance, index: true
      t.string :response
      t.integer :award

      t.timestamps
    end
  end
end
