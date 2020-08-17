class Game < ApplicationRecord
  include UuidSupport

  belongs_to :first_team, class_name: "Team"
  belongs_to :second_team, class_name: "Team"

  has_many :predictions

  scope :upcoming, -> { where("games.match_date >=  ?", Time.zone.now ) }
end