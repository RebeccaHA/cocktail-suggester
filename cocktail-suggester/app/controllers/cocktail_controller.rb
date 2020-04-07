class CocktailController < ApplicationController
   
    post '/cocktails' do
       
        user = Helpers.current_user(session)
        cocktail = Cocktail.find_by_id(params[:id])
        cocktail.user = user
        cocktail.save
      
        redirect to "/user/#{user.id}/cocktails"
    end

    delete '/user/:id/cocktail' do
    user = Helpers.current_user(session)

    cocktail = Cocktail.find_by_id(params[:cocktail][:id])

        if cocktail.user == user
          cocktail.user = nil
       cocktail.save
        end
        redirect to "/user/#{user.id}/cocktails"
    end
end