class ApplicationController < ActionController::Base
  def signed_user?
    session[:userinfo].present?
  end

  def authenticate_user!
    if signed_user?
      @current_user ||= session[:userinfo]
    else
      @auth_path = "#{controller_path}##{action_name}"
      redirect_to authentication_path if @auth_path != 'auth0#callback'
    end
  end

  def reset_session
    session[:userinfo] = nil if signed_user?
  end
end
