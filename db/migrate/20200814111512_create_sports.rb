class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports, id: :string do |t|
      t.string :name

      t.timestamps
    end
  end
end
