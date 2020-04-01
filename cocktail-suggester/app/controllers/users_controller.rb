class UserController < ApplicationController
    get '/login' do
    erb :'/users/login'
    end

    post'/login' do
        user = User.find_by(username: params[:username])
        if user !=nil && user.password == params[:password]
            session[:user_id] = user.id 
            redirect to '/users/show'
        end
        erb :'/users/error'
    end

    get '/signup' do
    erb :'/users/sign_up'
    end

    post '/signup' do
        user = User.create(params[:user])

    end


end