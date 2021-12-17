class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    publish_link = view_context.link_to("#{t('.success')}", result.html_url, target: '_blank')

    if result.success?
      Gist.create!(
        question: result.files.content,
        gist_url: result.html_url,
        user: current_user
      ).save!
      flash[:notice] = "#{publish_link}"
    else
      flash[:error] = "#{t('.failure')}"
    end

    redirect_to @test_passage
  end
end
