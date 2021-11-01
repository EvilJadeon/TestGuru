class Test < ApplicationRecord
  def self.test_names(category)
    joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category).pluck(:title)
  end
end
