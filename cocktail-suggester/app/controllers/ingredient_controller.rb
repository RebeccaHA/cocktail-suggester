class IngredientController < ApplicationController
    get '/ingredients' do
        @ingredients = Ingredient.all
        
        erb :'/ingredients/index'
    end

    get '/ingredients/new' do
        if !Helpers.is_logged_in?(session)
            redirect '/login'
        end
        erb :'/ingredients/new'
    end

    post '/ingredients' do
        ingredient_stash = Ingredient.create(params)
        user = Helpers.current_user(session)
        ingredient_stash.user = user
        ingredient_stash.save
    
        redirect to "/user/#{user.id}"
    end
end