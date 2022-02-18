class Badge < ApplicationRecord
  has_one_attached :image
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  RULES = {
    'first_try_pass' => 'First try pass test',
    'lose_10_tests' => 'Lose 10 tests',
    'pass_tests_category' => 'Pass all tests of a category',
    'pass_tests_level' => 'Pass all tests of a level'
  }.freeze
end
