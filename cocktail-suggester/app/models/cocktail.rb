class Cocktail < ActiveRecord::Base
    belongs_to :users
    belongs_to :ingredients
    
end