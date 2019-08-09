class ApplicationController < ActionController::Base
  def signed_user?
    session[:userinfo].present?
  end

  def authenticate_user!
    if signed_user?
      @current_user ||= User.find_or_create_by(account: session[:userinfo]['uid'])
    else
      redirect_to authentication_path
    end
  end

  def reset_session
    session[:userinfo] = nil if signed_user?
  end
end
