class AddPredictionPrizeToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :prediction_prize, :float
  end
end
