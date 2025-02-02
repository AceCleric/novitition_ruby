class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :string do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
