class FavouriteCocktailTypeColumnOnUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :favourite_cocktail, :string
  end
end
