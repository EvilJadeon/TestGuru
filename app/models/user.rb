class User < ApplicationRecord
  def passed_tests(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id')
      .where(tests: {level: level}, results: {user_id: id})
  end
end
