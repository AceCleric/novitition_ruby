class User < ApplicationRecord
  include UuidSupport
  has_secure_password

  has_one :wallet
  has_many :predictions

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  def name
    "#{first_name} #{last_name}"
  end
end
