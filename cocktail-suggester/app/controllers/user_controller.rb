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
        
        erb :'/users/account'
    end

    get '/logout' do
        session.clear

        redirect to '/login'
     end
        
    


end