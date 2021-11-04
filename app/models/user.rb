class User < ApplicationRecord

  has_many :results, dependent: :delete_all
  has_many :tests, through: :results, dependent: :delete_all

  def passed_tests(test_level)
    Test.joins(:results)
      .where(tests: {level: test_level}, results: {user: id})
  end
end
