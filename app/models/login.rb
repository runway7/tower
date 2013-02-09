class Login < ActiveRecord::Base
  has_many :accounts, through: :permissions
  has_many :permissions
end
