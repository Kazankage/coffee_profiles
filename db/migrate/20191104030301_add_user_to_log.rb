class AddUserToLog < ActiveRecord::Migration
  def change
    add_column :coffee_log, :users_id, :integer
  end
end
