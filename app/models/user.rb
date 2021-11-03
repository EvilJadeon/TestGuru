class User < ApplicationRecord

  has_many :results, dependent: :delete
  has_many :tests, through: :results, dependent: :delete

  def passed_tests(test_level)
    Test.joins(:results)
      .where(tests: {level: test_level}, results: :user)
  end
end
