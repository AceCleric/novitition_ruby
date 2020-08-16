class User < ApplicationRecord
  include UuidSupport
  has_secure_password


  has_one :wallet
  # has_many :predictions
end
