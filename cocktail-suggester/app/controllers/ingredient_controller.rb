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
        user = Helpers.is_logged_in?(session)
        ingredient_stash.user_id = user.id
        ingredient_stash.save

        redirect to "/users/#{user.id}"
    end
end