class AddUserIdToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktail, :user_id, :integer
  end
end
