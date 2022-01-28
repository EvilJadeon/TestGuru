class Badge < ApplicationRecord
  has_one_attached :image
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :user_badges

  RULES = {
    1 => 'First test complete',
    2 => 'Lose 3 tests',
    3 => 'Lose 10 tests'
  }.freeze
end
