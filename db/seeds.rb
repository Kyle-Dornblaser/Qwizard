# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin::Difficulty.delete_all
Admin::Question.delete_all
Admin::Choice.delete_all
Admin::QuestionInstance.delete_all

Admin::Difficulty.create(id: 1, points: 100)
Admin::Difficulty.create(id: 2, points: 1000)
Admin::Difficulty.create(id: 3, points: 10000)
Admin::Difficulty.create(id: 4, points: 1000000)

File.open("seed_data/questions.txt") do |questions|
    id_count = 0
    questions.read.each_line do |q|
        id_count += 1
        question_type, question, attempts, difficulty = q.chomp.split("|")
        Admin::Question.create!(:id => id_count, :question_type => question_type, :question => question, :attempts => attempts, :difficulty => Admin::Difficulty.find_by_id(difficulty))
  end
end


File.open("seed_data/choices.txt") do |choices|
    choices.read.each_line do |c|
        choice, correct_choice, question = c.chomp.split("|")
        Admin::Choice.create!(:choice => choice, :correct_choice => correct_choice, :question => Admin::Question.find_by_id(question))
  end
end
