class User < ApplicationRecord

  has_many :having_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, presence: true
  validates :email, presence: true

  def passed_tests(test_level)
    tests.where(level: test_level)
  end
  
end
