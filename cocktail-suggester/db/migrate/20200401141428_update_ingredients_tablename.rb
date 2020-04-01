class UpdateIngredientsTablename < ActiveRecord::Migration
  def change
    rename_table :ingredient, :ingredients
  end
end
