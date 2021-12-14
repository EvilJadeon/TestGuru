# frozen_string_literal: true

module ApplicationHelper

  FLASH_TYPES = {
    notice: 'alert-info',
    error: 'alert-danger'
  }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Click me', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(type)
    FLASH_TYPES[type]
  end
end
