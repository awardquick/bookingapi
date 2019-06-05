class RemoveAccountFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_reference :schedules, :account, foreign_key: true
  end
end
