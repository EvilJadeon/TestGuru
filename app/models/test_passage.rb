# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  SUCCESS_RATIO = 85

  def current_question_number
    self.test.questions.index(current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  def completed?
    current_question.nil? || difference_time.zero?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def update_successfull!
    update(successfull: true)
  end

  def success?
    success_rate >= SUCCESS_RATIO
  end

  def success_rate
    (correct_questions.to_f * 100) / test.questions.size
  end

  def timer_deadline
    self.created_at + (self.test.timer * 60)
  end

  def difference_time
    (timer_deadline - time_now).floor
  end

  def time_now
    Time.now
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end
end
