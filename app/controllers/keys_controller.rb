class KeysController < ApplicationController
  before_filter :account

  def index
  end

  def new    
  
  end

  def create    
    Key.create!({account: account}.update(params.permit(:name)))
    redirect_to account_path account
  end

  private 

  def account
    @account = Account.find params[:account_id]
  end
end
