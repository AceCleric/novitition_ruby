class AddCompetitionToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :competition_id, :string
  end
end
