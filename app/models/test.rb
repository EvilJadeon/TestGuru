class Test < ApplicationRecord

  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.test_names(category_title)
    joins(:category)
      .where(categories: {title: category_title})
      .order(title: :DESC)
      .pluck(:title)
  end
end
