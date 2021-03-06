class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in!"
    end
  end

  def prevent_login_signup
    if session[:user_id]
      redirect_to "/", notice: "You are already logged in!"
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def admin_user
    return unless session[:is_admin]
    @admin_user ||= User.find_by_id(session[:is_admin])
  end

  helper_method :current_user, :admin_user
end
