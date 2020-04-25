class StashController < ApplicationController
    get '/cabinets/new' do
        @hero_body="Add a cocktail cabinet"
        
        erb :'/cabinets/new'
    end

    post '/cabinets' do
        stash = Stash.create(name: params[:name])
        stash.save

        params[:ingredients].each do |ingredient|
            i = Ingredient.create(ingredient)
            i.stash = stash
            i.save
      
        end
        flash[:success] = "Cabinet successfully created"
        redirect to "/cabinets/#{stash.id}/cocktail"
    end

   

  


    get '/cabinets/:id/cocktail' do
        @hero_body = "Cocktails from your cabinet"
        @hero_subtitle= "If a cocktail takes your fancy, you can save it to your bar to revist at a later date"
        @stash = Stash.find_by_id(params[:id])
        @cocktails = Cocktail.all.select do |cocktail|
            @stash.ingredients.detect do |ingredient|
                cocktail.ingredients.downcase.include?(ingredient.name.downcase)
              
            end
           
        end
    
       
        
        erb :'/cocktails/show'
    end

    get '/cabinets/:id/edit' do
      user = Helpers.current_user(session)
       if user == Helpers.current_user(session) 
        @stash = Stash.find_by_id(params[:id])
        @user = @stash.user
        erb :'/cabinets/edit'
       else
        redirect "/login"
       end
    end

    patch '/cabinets/:id' do
        user = Helpers.current_user(session)
     
       stash = Stash.find_by_id(params[:id])
        if stash.user == Helpers.current_user(session)
    
         stash.update(params[:stash])
         
       
         
         params[:ingredients].each do |ingredient|
            i= Ingredient.find_by_id(ingredient[:id])
            i.update(ingredient)
            i.save
        end
            redirect to "/user/#{user.id}"
         
         else
            flash[:danger] = "You can't update another users stash"
        redirect to  "/user/#{user.id}"
        end
     
    end

    delete '/cabinets/:id' do
        stash = Stash.find_by_id(params[:id])
        user = Helpers.current_user(session)
    
        if user == Helpers.current_user(session) 
         stash.delete
         flash[:danger] = "Cabinet deleted"
        
         redirect to "/user/#{user.id}"
        else
         redirect to "/login"
        end
     end

    end
