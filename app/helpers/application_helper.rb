module ApplicationHelper
  def body_classes
    if params[:controller]=='static_pages' && params[:action]=='home' && user_signed_in?
      "users show #{content_for(:body_class)}"
    else
      "#{params[:controller]} #{params[:action]} #{content_for(:body_class)}"
    end
  end
end
