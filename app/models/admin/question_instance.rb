class Admin::QuestionInstance < ActiveRecord::Base
  belongs_to :question
  has_many :userresponses
  has_many :users, through: :userresponses
end
