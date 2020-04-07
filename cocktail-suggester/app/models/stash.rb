class Stash < ActiveRecord::Base
    belongs_to :user
    
    has_and_belongs_to_many :cocktails
    has_many :ingredients

    validates :name, presence: true
   

 end