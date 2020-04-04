class StashController < ApplicationController
    get '/stashes' do
        @stashes = Stash.all
        erb :'/stashes/index'
    end

    get '/stashes/new' do
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
    
        redirect to "/user/#{user.id}"
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


end