class CreateIngredient < ActiveRecord::Migration
  def change
    create_table :ingredient do |t|
      t.string :ingredient_slot_1
      t.string :ingredient_slot_2
      t.string :ingredient_slot_3
      t.string :ingredient_slot_4
      t.string :ingredient_slot_5
    end
  end
end
