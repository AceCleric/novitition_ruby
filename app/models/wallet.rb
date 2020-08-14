class Wallet < ApplicationRecord
  include UuidSupport

  belongs_to :user
end
