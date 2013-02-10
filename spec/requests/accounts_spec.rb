require 'spec_helper'

describe "Accounts" do
  describe "account creation" do
    it "" do
      login
      create_account 'A1'

      Account.all.size.should == 1
      Permission.all.size.should == 1
      Login.all.size.should == 1

      Permission.first.account.should == Account.first
      Permission.first.login.should == Login.first
      Permission.first.owner.should be_true

      Account.first.name.should == 'A1'
      Login.first.email.should == 'sudhir.j@gmail.com'
    end
  end
end

private

def login
  visit '/auth/developer'
  fill_in 'name', with: 'Sudhir'
  fill_in 'email', with: 'sudhir.j@gmail.com'
  click_button('Sign In')
end

def create_account(name)
  page.should have_content 'You have no accounts.'
  click_link 'Create Account'
  fill_in 'name', with: name
  click_button 'Create'
  page.should have_content "Account Details: #{name}"
  page.should have_content 'You have no API keys in this account.'
end
