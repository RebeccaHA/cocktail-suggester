class UpdateCocktailsTablename < ActiveRecord::Migration
  def change
    rename_table :cocktail, :cocktails
  end
end
