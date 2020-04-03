class IngredientController < ApplicationController
    get '/ingredients' do
        @ingredients = Ingredient.all
        
        erb :'/ingredients/index'
    end

    get '/ingredients/new' do
    
        erb :'/ingredients/new'
    end

    post '/ingredients' do
        ingredient_stash = Ingredient.create(params)
        user = Helper.is_logged_in?
        ingredient_stash.user = user
        ingredient_stash.save
        
        redirect to "/users/#{user.id}"
    end
end