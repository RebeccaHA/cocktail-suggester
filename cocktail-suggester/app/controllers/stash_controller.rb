class StashController < ApplicationController

    patch '/stashes/:id' do
     

        stashes = Stash.find_by_id(params[:id])
        if stashes.user == Helpers.current_user(session)
         stashes.update(params[:stashes])
        
       user = Helpers.current_user(session)
        redirect to "/user/#{user.id}"
       end
       erb :'/users/error'
       end
   
   
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
        stash = Stash.create(params)
        user = Helpers.current_user(session)
        stash.user = user
        stash.save
    
        redirect to "/user/#{user.id}"
    end



    get '/stashes/:id/edit' do
        @stash = Stash.find_by_id(params[:id])
        @user = @stash.user
        erb :'/stashes/edit'
    end


end