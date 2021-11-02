# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: 'Reading'}, {title: 'Writing'}])

users = User.create!([{name: 'Ivan'}, {name: 'Anna'}, {name: 'Andrew'}, {name: 'Dmitriy'}])

tests = Test.create!([
  {title: 'Тест на глагол TO BE', level: 1, author_id: users[0].id, category_id: categories[1].id},
  {title: 'Тест на глагол TO HAVE', author_id: users[1].id, category_id: categories[1].id},
  {title: 'Тест на глаголы DO и MAKE', level: 2, author_id: users[2].id, category_id: categories[1].id},
  {title: 'Тест на времена CONTINUOUS', level: 2, author_id: users[3].id, category_id: categories[0].id}
])

questions = Question.create!([
  {body: 'I __ dissappointed by your desicion', test_id: tests[0].id},
  {body: 'I __ a big family', test_id: tests[1].id},
  {body: 'Do not __ anything stupid!', test_id: tests[2].id},
  {body: 'Утром шел дождь.', test_id: tests[3].id}
])

answers = Answer.create!([
  {body: 'was', correct: true, question_id: questions[0].id},
  {body: 'has been', question_id: questions[0].id},
  {body: 'am being', question_id: questions[0].id},

  {body: 'have', correct: true, question_id: questions[1].id},
  {body: 'had', question_id: questions[1].id},
  {body: 'has', question_id: questions[1].id},

  {body: 'do', correct: true, question_id: questions[2].id},
  {body: 'make', question_id: questions[2].id},

  {body: 'It was raining this morning.', correct: true, question_id: questions[3].id},
  {body: 'It was rained this morning.', question_id: questions[3].id},
  {body: 'It were raining this morning.', question_id: questions[3].id}
])

results = Result.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[2].id}
])