class CreateCompetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :competitions, id: :string do |t|
      t.string :name
      t.string :sport_id

      t.timestamps
    end
  end
end
