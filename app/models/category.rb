class Category < ApplicationRecord
  has_many :tests, dependent: :delete
end
