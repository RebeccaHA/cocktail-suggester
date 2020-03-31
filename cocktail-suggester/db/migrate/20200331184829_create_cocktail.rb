class CreateCocktail < ActiveRecord::Migration
  def change
    create_table :cocktail do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.string :garnish
      t.string :glassware
      t.integer :method_time
    end
  end
end
