class UpdateColumnNameUserIdIngredientIdInCocktailsTable < ActiveRecord::Migration
  def change
    rename_column :cocktails, :user_id, :ingredient_id
  end
end
