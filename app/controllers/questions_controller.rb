class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    unless find_question
      render text: 'Question not found!'
    end
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      flash[:success] = "Question saved successfully"
      redirect_to test_questions_url
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:body])
  end

  def question_params
    params.require(:questions).permit(:body)
  end

  def rescue_with_question_not_found
    render html: '<h3>Question not found</h3>'.html_safe
  end
end
