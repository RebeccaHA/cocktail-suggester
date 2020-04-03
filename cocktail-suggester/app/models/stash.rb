class Stash < ActiveRecord::Base
    belongs_to :user
    has_one :cocktail
    has_many :ingredients
 end