module ApplicationHelper
  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    @markdown.render(text)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
