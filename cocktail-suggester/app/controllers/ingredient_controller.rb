class IngredientController < ApplicationController
    get '/ingredients' do
        @ingredients = Ingredient.all
        
        erb :'ingredients/index'
    end
end