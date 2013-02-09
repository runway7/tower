require 'spec_helper'

describe "Logins" do
  describe "GET /logins" do
    it "should open base pages without login" do      
      visit root_url      
      page.should have_content "Tower"
    end

    it 'should not be able to access other pages' do      
      visit accounts_url
      page.should have_content "FORBIDDEN"
    end
  end
end
