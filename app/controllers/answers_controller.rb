# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
end
