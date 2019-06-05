class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :user_name
      t.string :status
      t.string :type
      t.bigint :acct_num

      t.timestamps
    end
  end
end
