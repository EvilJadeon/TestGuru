# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { case_sensitive: false, scope: :level,
                                  message: 'There can only be one test with a given name and level' }

  scope :test_level_easy, -> { where(level: (0..1)) }
  scope :test_level_middle, -> { where(level: (2..4)) }
  scope :test_level_hard, -> { where(level: (5..Float::INFINITY)) }

  scope :test_names, lambda { |category_title|
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :DESC)
  }

  def self.test_names_title(category_title)
    test_names(category_title).pluck(:title)
  end
end
