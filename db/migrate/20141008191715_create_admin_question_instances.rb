class CreateAdminQuestionInstances < ActiveRecord::Migration
  def change
    create_table :admin_question_instances do |t|
      t.references :question, index: true

      t.timestamps
    end
  end
end
