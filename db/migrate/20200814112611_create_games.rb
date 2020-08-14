class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games, id: :string do |t|
      t.string :first_team
      t.string :second_team
      t.date :match_date
      t.string :location
      t.integer :score_first_team
      t.integer :score_second_team

      t.timestamps
    end
  end
end
