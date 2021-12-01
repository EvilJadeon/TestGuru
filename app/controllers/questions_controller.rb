# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def rescue_with_question_not_found
    render html: '<h3>Question not found</h3>'.html_safe
  end
end
