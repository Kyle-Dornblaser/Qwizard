class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_type
      t.string :question
      t.integer :attempts
      t.references :difficulty, index: true

      t.timestamps
    end
  end
end
