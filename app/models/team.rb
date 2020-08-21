class Team < ApplicationRecord
  include UuidSupport

  belongs_to :competition
  has_many :predictions
end
