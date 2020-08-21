class Prediction < ApplicationRecord
  include UuidSupport

  belongs_to :user
  belongs_to :game
  belongs_to :team, class_name: "Team"

  scope :not_synced, -> { where(synced: false) }

  def passed?
    return self if game.result == team 
    return_points if game.result == "draw"
    return
  end

  def pending?
    return self if game.has_not_started?
  end

  def claime_prize
    user.wallet.update(add_credit: points + game.prediction_prize)
    sync_prediction
  end
  
  private

  def return_points
    user.wallet.update(add_credit: points)
    sync_prediction
  end

  def sync_prediction
    update_attribute(:synced, true)
  end
end
