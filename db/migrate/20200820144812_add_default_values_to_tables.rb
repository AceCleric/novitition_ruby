class AddDefaultValuesToTables < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :prediction_prize, :float, default: 0
    change_column :games, :score_first_team, :integer, default: 0
    change_column :games, :score_second_team, :integer, default: 0
    change_column :predictions, :points, :integer, default: 0
    change_column :wallets, :credit, :float, default: 20
    change_column :wallets, :add_credit, :float, default: 0
    change_column :wallets, :remove_credit, :float, default: 0
  end
end
