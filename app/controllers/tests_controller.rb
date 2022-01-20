# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    if current_user.test_passage.total_questions > 0
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:error] = 'Тест не содержит ни одного вопроса!'
    end
  end
end
