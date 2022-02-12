class Badge < ApplicationRecord
  has_one_attached :image
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :user_badges

  RULES = {
    1 => 'First try pass test',
    2 => 'Lose 10 tests',
    3 => 'Pass all tests of a category',
    4 => 'Pass all tests of a level'
  }.freeze
end
