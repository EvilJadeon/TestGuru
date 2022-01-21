# frozen_string_literal: true

module ApplicationHelper
  FLASH_TYPES = {
    notice: 'alert-info',
    warning: 'alert-warning',
    success: 'alert-success'
  }

  def current_year
    Date.current.years
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(type)
    content_tag :div, flash[type], class: "alert #{FLASH_TYPES[type]}" if flash[type].present?
  end
end
