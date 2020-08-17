class AddNationalityToCompetition < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :nationality, :string
  end
end
