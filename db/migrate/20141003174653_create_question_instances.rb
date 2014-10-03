class CreateQuestionInstances < ActiveRecord::Migration
  def change
    create_table :question_instances do |t|
      t.references :question, index: true

      t.timestamps
    end
  end
end
