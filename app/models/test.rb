class Test < ApplicationRecord
  def self.test_names(category)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: category})
      .order(id: :DESC)
      .pluck(:title)
  end

  belongs_to :category
  belongs_to :user

  has_many :questions

  has_many :results
  has_many :users, through: :results
end
