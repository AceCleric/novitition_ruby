class Prediction < ApplicationRecord
  include UuidSupport

  belongs_to :user
  belongs_to :game
  belongs_to :team, class_name: "Team"

  def passed?
    return team if game.result == team 
  end
end
