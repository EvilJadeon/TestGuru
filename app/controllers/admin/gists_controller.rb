# frozen_string_literal: true

module Admin
  class GistsController < Admin::BaseController
    def index
      @gists = Gist.order(created_at: :desc)
    end
  end
end
