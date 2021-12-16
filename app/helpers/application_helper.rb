# frozen_string_literal: true

module ApplicationHelper

  FLASH_TYPES = {
    notice: 'alert-info',
    error: 'alert-danger',
    success: 'alert-success'
  }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Click me', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(type)
    content_tag :div, flash[type] ,class: "alert #{FLASH_TYPES.fetch(type.to_sym, type)}"
  end
end
