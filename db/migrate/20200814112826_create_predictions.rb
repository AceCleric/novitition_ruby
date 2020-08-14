class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions, id: :string do |t|
      t.string :team_id
      t.boolean :will_win
      t.string :user_id
      t.integer :points

      t.timestamps
    end
  end
end
