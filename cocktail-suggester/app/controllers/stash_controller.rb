class StashController < ApplicationController
    get '/stashes/new' do
        @hero_body="Add a cocktail cabinet"
        if !Helpers.is_logged_in?(session)
            redirect '/login'
        end
        erb :'/stashes/new'
    end

    post '/stashes' do
        stash = Stash.create(name: params[:name])
        user = Helpers.current_user(session)
       
        stash.user = user
        stash.save

        params[:ingredients].each do |ingredient|
            i = Ingredient.create(ingredient)
            i.stash = stash
            i.save
       
        end
        flash[:success] = "Cabinet successfully created"
        redirect to "/user/#{user.id}"
    end

    get '/stashes/:id/cocktail' do
        @stash = Stash.find_by_id(params[:id])
        @cocktails = Cocktail.all.select do |cocktail|
            @stash.ingredients.detect do |ingredient|
                cocktail.ingredients.include?(ingredient.name)
              
            end
           
        end
    
        #@cocktails.stash = @stash
       # @cocktails.save
        
        erb :'/cocktails/show'
    end



    get '/stashes/:id/edit' do
        @stash = Stash.find_by_id(params[:id])
        @user = @stash.user
        erb :'/stashes/edit'
    end

    patch '/stashes/:id' do
     
       stash = Stash.find_by_id(params[:id])
        if stash.user == Helpers.current_user(session)
    
         stash.update(params[:stash])
         user = Helpers.current_user(session)
       
         
         params[:ingredients].each do |ingredient|
            i= Ingredient.find_by_id(ingredient[:id])
            i.update(ingredient)
            i.save
        
        end
         redirect to "/user/#{user.id}"
       end
     erb :'/users/error'
    end

    delete '/stashes/:id' do
        stash = Stash.find_by_id(params[:id])
        user = Helpers.current_user(session)
    
        if user == Helpers.current_user(session) 
            stash.delete
            flash[:danger] = "Cabinet deleted"
        end
     redirect to "/user/#{user.id}"
     end

   

end