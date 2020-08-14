class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams, id: :string do|t|
      t.string :name
      t.string :country
      t.string :competition_id

      t.timestamps
    end
  end
end
