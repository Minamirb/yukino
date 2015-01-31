class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_auth
    @current_auth ||= session[:auth_id] && Auth.find(session[:auth_id])
  end

  def require_authentication
    redirect_to root_path unless current_auth
  end

  def current_user
    @current_user ||= current_auth && current_auth.user
  end

  helper_method :current_auth
end
