class Cocktail < ActiveRecord::Base
    belongs_to :stash
  #  has_many :ingredients, through: :stash
    
end