# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create

  SUCCESS_RATIO = 85

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def total_questions
    test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question

    save!
  end

  def update_successfull!
    update!(successfull: true)
  end

  def success?
    success_rate >= SUCCESS_RATIO
  end

  def success_rate
    (correct_questions.to_f * 100) / test.questions.size
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_current_question
    self.current_question = test.questions.first if test.present?
  end
end
