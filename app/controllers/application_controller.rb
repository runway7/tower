class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :assert_login

  def current_user
    logged_in_email = session[:logged_in_email]
    raise 'No user logged in' if logged_in_email.blank?
    Login.find_or_create_by(email: logged_in_email)
  end

  def assert_login
    if session[:logged_in_email].blank?
      render text: 'FORBIDDEN', status: 403 
      return false
    end
    @current_user = current_user
  end
end
