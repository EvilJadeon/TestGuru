class Test < ApplicationRecord

  belongs_to :category

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.test_names(category_title)
    joins(:category)
      .where(categories: {title: category_title})
      .order(id: :DESC)
      .pluck(:title)
  end
end
