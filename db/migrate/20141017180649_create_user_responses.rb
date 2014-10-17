class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.string :response
      t.integer :award
      t.references :question_instance, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
