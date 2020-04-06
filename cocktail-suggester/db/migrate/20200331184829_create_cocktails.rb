class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :description
      t.integer :stash_id
      t.string :garnish
      t.string :glassware
      t.string :method
    end
  end
end
