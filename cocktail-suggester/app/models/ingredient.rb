class Ingredient < ActiveRecord::Base
   belongs_to :user
   has_many :cocktails
end