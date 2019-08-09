module ApplicationHelper
  def current_user
    user = session[:userinfo]
    if user.present?
      @current_user ||= User.where(account: user['uid'])
    end
  end

  def current_user_name
    @user_name ||=  session[:userinfo]['info']['name'].split.first
  end
end
