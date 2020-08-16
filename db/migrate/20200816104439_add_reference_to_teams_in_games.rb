class AddReferenceToTeamsInGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :first_team, :first_team_id
    rename_column :games, :second_team, :second_team_id
    change_column :games, :first_team_id, :string
  end
end
