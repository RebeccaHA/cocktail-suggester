class Cocktail < ActiveRecord::Base
    belongs_to :users
    has_many :ingredients
    
end