class UserResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :questioninstance
end
