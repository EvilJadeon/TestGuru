class User < ApplicationRecord
  def passed_tests(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id')
      .where(tests: {level: level}, results: {user_id: id})
  end

  has_many :tests

  has_many :results
  has_many :tests, through: :results
end
