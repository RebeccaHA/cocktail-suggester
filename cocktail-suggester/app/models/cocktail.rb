class Cocktail < ActiveRecord::Base
   
    has_and_belongs_to_many :stashes
    belongs_to :user
 
    
end