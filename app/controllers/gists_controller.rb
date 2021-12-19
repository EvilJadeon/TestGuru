# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    service = GistQuestionService.new(@test_passage.current_question)

    url = service.call.html_url

    if service.success?
      current_user.gists.create(question: @test_passage.current_question, gist_url: url)

      flash[:notice] = t('.success', link: url)
    else
      flash[:error] = t('.failure')
    end

    redirect_to @test_passage
  end
end
