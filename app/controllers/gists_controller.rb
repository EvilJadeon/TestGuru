class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    service = GistQuestionService.new(@test_passage.current_question)
  
    url = service.call.html_url

    if service.success?
      Gist.new(user: current_user, question: @test_passage.current_question, gist_url: url).save
      flash[:notice] = "#{view_context.link_to("#{t('.success')}", url, target: '_blank')}"
    else
      flash[:error] = "#{t('.failure')}"
    end

    redirect_to @test_passage
  end
end
