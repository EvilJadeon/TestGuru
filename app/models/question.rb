# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy, on_delete: :cascade
  has_many :gists, dependent: :destroy, on_delete: :cascade

  validates :body, presence: true
end
