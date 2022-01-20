# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    if @test.questions.count > 0 && @test.completed
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash.now[:notice] = 'Нет доступа к тесту!'
    end
  end
end
