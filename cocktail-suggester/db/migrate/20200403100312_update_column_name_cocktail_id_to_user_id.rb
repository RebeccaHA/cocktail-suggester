class UpdateColumnNameCocktailIdToUserId < ActiveRecord::Migration
  def change
    rename_column :ingredients, :cocktail_id, :user_id
  end
end
