class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, presence: true
  validates :email, presence: true

  def passed_tests(test_level)
    Test.joins(:result)
    .where(tests: {level: test_level}, results: {user: id})
  end
end
