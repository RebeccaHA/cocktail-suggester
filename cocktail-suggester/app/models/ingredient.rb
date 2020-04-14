class Ingredient < ActiveRecord::Base
   belongs_to :stash
  

   validates :name, presence: true
   
end

