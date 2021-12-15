# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Reading' }, { title: 'Writing' }])

users = User.create!([{ email: 'ivan@ya.ru', password: '12345678' },
                      { email: 'anna@ya.ru', password: '12345678' },
                      { email: 'andrew@ya.ru', password: '12345678' },
                      { email: 'dm@ya.ru', password: '12345678' }])

tests = Test.create!([
                       { title: 'Тест на глагол TO BE', level: 1, author: users[0], category: categories[1] },
                       { title: 'Тест на глагол TO HAVE', author: users[1], category: categories[1] },
                       { title: 'Тест на глаголы DO и MAKE', level: 2, author: users[2], category: categories[1] },
                       { title: 'Тест на времена CONTINUOUS', level: 2, author: users[3], category: categories[0] }
                     ])

questions = Question.create!([
                               { body: 'I __ dissappointed by your desicion', test: tests[0] },
                               { body: 'I __ a big family', test: tests[1] },
                               { body: 'Do not __ anything stupid!', test: tests[2] },
                               { body: 'Утром шел дождь.', test: tests[3] }
                             ])

answers = Answer.create!([
                           { body: 'was', correct: true, question: questions[0] },
                           { body: 'has been', question: questions[0] },
                           { body: 'am being', question: questions[0] },

                           { body: 'have', correct: true, question: questions[1] },
                           { body: 'had', question: questions[1] },
                           { body: 'has', question: questions[1] },

                           { body: 'do', correct: true, question: questions[2] },
                           { body: 'make', question: questions[2] },

                           { body: 'It was raining this morning.', correct: true, question: questions[3] },
                           { body: 'It was rained this morning.', question: questions[3] },
                           { body: 'It were raining this morning.', question: questions[3] }
                         ])
