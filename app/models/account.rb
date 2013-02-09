class Account < ActiveRecord::Base
  has_many :logins, through: :permissions
  has_many :permissions
end
