class AccountsController < ApplicationController  
  def index
    @accounts = current_user.accounts
  end

  def new
  end
end
