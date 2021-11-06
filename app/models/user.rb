class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def passed_tests(test_level)
    Test.joins(:results)
      .where(tests: {level: test_level}, results: {user: id})
  end
end
