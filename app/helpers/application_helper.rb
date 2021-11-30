module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Click me', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.each do |key, message|
      tag.div class: "alert alert-#{key}"
        return message
    end
  end
end
