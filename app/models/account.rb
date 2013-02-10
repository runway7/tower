class Account < ActiveRecord::Base
  has_many :logins, through: :permissions
  has_many :permissions
  has_many :keys

  validates_presence_of :name
end
