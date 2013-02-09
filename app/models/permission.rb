class Permission < ActiveRecord::Base
  belongs_to :account
  belongs_to :login
end
