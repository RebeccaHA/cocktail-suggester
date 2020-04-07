class CocktailController < ApplicationController
   
    post '/cocktails' do
       
        user = Helpers.current_user(session)
        cocktail = Cocktail.create(params[:cocktail])
        cocktail.user = user
        cocktail.save
      
    
        redirect to "/user/#{user.id}/cocktail"
    end

end