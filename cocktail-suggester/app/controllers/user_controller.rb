class UserController < ApplicationController
    
    get '/login' do
        
    erb :'/users/login'
    end

    post'/login' do
        user = User.find_by(username: params[:username])
        if user !=nil && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/user/#{user.id}"
        end
        erb :'/users/error'
    end

    get '/signup' do
    erb :'/users/sign_up'
    end

    post '/signup' do
        user = User.create(params)
        user.save
        session[:user_id] = user.id

        redirect "/user/#{user.id}"
    end

    get '/user/:id' do
        @user = User.find_by_id(params[:id])
        @stashes = @user.stashes
        
        erb :'/users/show'
    end

    get '/account/:id' do 
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
         erb :'users/account'
        end
    end

    get '/account/:id/edit' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
         erb :'users/account_edit'
        end
    end

    patch '/account/:id' do
        user = User.find_by_id(params[:id])
    
        if user == Helpers.current_user(session) 
            user.update(params[:user])

        redirect to "/account/#{user.id}"
        end
    end

    get '/logout' do
        session.clear

        redirect to '/login'
     end
        
    


end