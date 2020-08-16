class AddGameIdToPrediction < ActiveRecord::Migration[6.0]
  def change
    add_column :predictions, :game_id, :string
  end
end
