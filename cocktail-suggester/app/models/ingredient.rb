class Ingredient < ActiveRecord::Base
   belongs_to :stash
   has_one :cocktail, through: :stash

   
end