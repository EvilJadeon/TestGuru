class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    unless find_question
      render text: 'Question not found!'
    end
  end

  def new
    @question = Question.new
  end

  def edit
    find_question
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id, :id)
  end

  def rescue_with_question_not_found
    render html: '<h3>Question not found</h3>'.html_safe
  end
end
