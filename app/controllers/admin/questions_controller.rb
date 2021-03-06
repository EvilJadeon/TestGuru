# frozen_string_literal: true

  class Admin::QuestionsController < Admin::BaseController
    before_action :find_test, only: %i[create new]
    before_action :find_question, only: %i[show edit update destroy]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

    def show; end

    def new
      @question = Question.new
    end

    def edit; end

    def create
      @question = @test.questions.new(question_params)

      if @question.save
        redirect_to admin_test_path(@question.test), success: t('.success')
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@question.test), success: t('.update_success')
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_test_path(@question.test), notice: t('.delete')
    end

    private

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body)
    end

    def rescue_with_question_not_found
      render html: '<h3>Question not found</h3>'.html_safe
    end
  end
