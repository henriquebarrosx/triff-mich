class User < ApplicationRecord
  has_many :events
  validates_presence_of :name, :email
end