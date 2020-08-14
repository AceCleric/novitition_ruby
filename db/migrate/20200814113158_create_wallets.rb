class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets, id: :string do |t|
      t.float :credit
      t.string :user_id
      t.float :add_credit
      t.float :remove_credit

      t.timestamps
    end
  end
end
