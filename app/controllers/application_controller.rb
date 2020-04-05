class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= session[:current_user]
  end

  def logged_in?
    current_user != nil
  end
end
