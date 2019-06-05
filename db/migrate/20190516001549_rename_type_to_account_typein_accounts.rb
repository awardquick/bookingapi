class RenameTypeToAccountTypeinAccounts < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :type, :acct_type
  end
end
