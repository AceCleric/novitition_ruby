class Team < ApplicationRecord
  include UuidSupport

  belongs_to :competition
  belongs_to :game
  has_many :predictions
end
