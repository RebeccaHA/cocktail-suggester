class SiteController < ApplicationController
    get '/about' do
        user = User.create
        user.id = session.id
        user.save
        @hero_body = "Cocktail Confidant"
        erb :'users/about'
    end

end