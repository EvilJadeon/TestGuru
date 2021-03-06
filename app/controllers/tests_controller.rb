# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    if @test.completed
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, warning: 'Нет доступа к тесту!'
    end
  end
end
