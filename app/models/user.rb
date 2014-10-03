class User < ActiveRecord::Base
  has_many :userresponses
  has_many :questioninstances, through: :userresponses
end
