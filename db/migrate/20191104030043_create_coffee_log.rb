class CreateCoffeeLog < ActiveRecord::Migration
   def change
     create_table :coffee_log do |t|
    t.integer :user_id
    t.string  :name
  end
  end
end