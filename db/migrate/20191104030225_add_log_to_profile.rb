class AddLogToProfile < ActiveRecord::Migration
 def change
    add_column :coffee_log, :coffee_profile, :integer
  end
end
