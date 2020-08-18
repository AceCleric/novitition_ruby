class AddDescriptionToSport < ActiveRecord::Migration[6.0]
  def change
    add_column :sports, :description, :text
  end
end
