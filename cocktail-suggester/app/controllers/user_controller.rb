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
        flash[:success] = "Account successfully created"
        redirect "/user/#{user.id}"
        
    end

    get '/user/:id' do
        @hero_body = "Cocktail cabinet"
        @user = User.find_by_id(params[:id])
        @stashes = @user.stashes
        
        erb :'/users/show'
    end

    get '/user/:id/cocktails' do
        @hero_body = "The Bar"
        @user = User.find_by_id(params[:id])
        @cocktails = @user.cocktails
        erb :'/cocktails/index'
    end


    get '/account/:id' do 
        @hero_body = "Account"
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
         erb :'users/account'
        end
    end

    get '/account/:id/edit' do
        @hero_body = "Edit your account"
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

     delete '/account/:id' do
        user = User.find_by_id(params[:id])
    
        if user == Helpers.current_user(session) 
            user.destroy
            session.clear
            flash[:danger] = "Account deleted"
        end
        redirect to '/signup'
     end
        
    


end