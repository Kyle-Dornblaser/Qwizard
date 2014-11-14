class AddCorrectToUserResponses < ActiveRecord::Migration
  def change
    add_column :user_responses, :correct, :boolean
  end
end
