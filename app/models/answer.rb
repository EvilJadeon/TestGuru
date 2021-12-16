# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def number_of_answers
    errors.add(:base, 'Count of answers must be 1 to 4') if question.answers.count > 4
  end
end
