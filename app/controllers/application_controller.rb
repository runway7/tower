class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :assert_login

  def current_user
    logged_in_email = session[:logged_in_email]
    raise 'No user logged in' if logged_in_email.blank?
    @current_user ||= Login.find_or_create_by(email: logged_in_email)
  end

  def assert_login
    if current_user.nil?
      render text: 'FORBIDDEN', status: 403
      return false
    end
  end
end
