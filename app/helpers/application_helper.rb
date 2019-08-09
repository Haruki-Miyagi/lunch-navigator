module ApplicationHelper
  def current_user_name
    @user_name ||=  session[:userinfo]['info']['name'].split.first
  end
end
