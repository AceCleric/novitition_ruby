class Game < ApplicationRecord
  include UuidSupport

  belongs_to :first_team, class_name: "Team"
  belongs_to :second_team, class_name: "Team"

  has_many :predictions

  scope :past,  -> { where("games.match_date <  ?", Time.zone.now ) }
  scope :today, -> { where("games.match_date BETWEEN ? AND  ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day) }
  scope :upcoming, -> { where("games.match_date >=  ?", Time.zone.now ) }
end