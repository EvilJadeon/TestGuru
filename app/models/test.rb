class Test < ApplicationRecord

  belongs_to :category

  has_many :questions, dependent: :delete_all
  has_many :results, dependent: :delete_all
  has_many :users, through: :results, dependent: :delete_all

  def self.test_names(category_title)
    joins(:category)
      .where(categories: {title: category_title})
      .order(title: :DESC)
      .pluck(:title)
  end
end
