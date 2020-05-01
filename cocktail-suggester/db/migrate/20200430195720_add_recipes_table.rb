class AddRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.string :method
    end
  end
end
