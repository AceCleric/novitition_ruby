class Prediction < ApplicationRecord
  include UuidSupport

  belongs_to :user
  has_one :game
end
