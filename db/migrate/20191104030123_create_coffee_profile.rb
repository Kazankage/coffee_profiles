class CreateCoffeeProfile < ActiveRecord::Migration
   def change
     create_table :coffee_profile do |t|
    t.integer :user_id
    t.string  :name
    t.string  :prepare
    t.string  :region
    t.string  :aroma
    t.string  :flavour
    t.string  :acidity
    t.string  :body
    t.string  :food
    t.string  :notes
  end
  end
end
