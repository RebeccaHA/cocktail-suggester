class AddCocktailIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredient, :cocktail_id, :integer
  end
end
