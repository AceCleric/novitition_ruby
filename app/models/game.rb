class Game < ApplicationRecord
  include UuidSupport

  belongs_to :first_team, class_name: "Team"
  belongs_to :second_team, class_name: "Team"
  belongs_to :competition

  has_many :predictions

  scope :past,  -> { where("games.match_date <  ?", Time.zone.now ) }
  scope :today, -> { where("games.match_date BETWEEN ? AND  ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day) }
  scope :upcoming, -> { where("games.match_date >=  ?", Time.zone.now ) }

  def result
    return if Time.zone.now < match_date

    if score_first_team > score_second_team
      return first_team
    elsif score_second_team > score_first_team
      return second_team
    else
      return "draw"
    end
  end

  def has_not_started?
    match_date > Time.zone.now
  end
end