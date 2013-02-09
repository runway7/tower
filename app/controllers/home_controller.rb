class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:login]
  skip_before_filter :assert_login
  
  def index
  end

  def login
    email_id = request.env['omniauth.auth']["uid"]
    session[:logged_in_email] = email_id    
    redirect_to accounts_path
  end

  def logout
    reset_session
    redirect_to root_url
  end
end
