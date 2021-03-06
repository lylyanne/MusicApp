class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  def require_no_login_user!
    redirect_to user_url(current_user) unless current_user.nil?
  end

  def require_login_user!
    redirect_to new_session_url if current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
      !current_user.nil?
  end

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
