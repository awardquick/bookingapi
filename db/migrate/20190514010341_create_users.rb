class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.integer :role
      t.references :account, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
