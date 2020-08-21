# frozen_string_literal: true

class SyncPredictionsJob < ApplicationJob 
  def sync
    predictions = Prediction.not_synced
    won_predictions = predictions.map(&:passed?).compact
    won_predictions.map(&:claime_prize)
  end
end
