class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def new

  end

  def create
    ActiveRecord::Base.transaction do
      account = Account.create! params.permit(:name)
      Permission.create! account: account, login: current_user, owner: true
      redirect_to account_url account
    end

  end

  def show
    @account = Account.find params[:id]
  end
end
