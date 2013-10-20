module ApplicationHelper
  def markdown(text = nil)
    return '' if text.nil?

    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    @markdown.render(text)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_active(controller, action, id = nil)
    if id 
      params[:controller] == controller && params[:action] == action && params[:id] == id ? "active" : nil
    else
      params[:controller] == controller && params[:action] == action ? "active" : nil    
    end  
  end

end
