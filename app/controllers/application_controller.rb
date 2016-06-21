class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_chalaune, :logged_in?

  def current_chalaune
   @current_chalaune ||= Chalaune.find(session[:chalaune_id]) if session[:chalaune_id]
  end

  def logged_in?
    !!current_chalaune
  end

  def require_chalaune
    if !logged_in?
    flash[:danger] = "you must be logged in to perform that action"
    redirect_to root_path
    end
  end

end
