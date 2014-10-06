class UserResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :questioninstance, :class_name => 'QuestionInstance'
end
