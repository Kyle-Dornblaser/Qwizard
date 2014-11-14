class UserResponse < ActiveRecord::Base
  belongs_to :question_instance
  belongs_to :user
end
