class SiteController < ApplicationController
    get '/about' do
        @hero_body = "Cocktail Confidant"
        erb :'users/about'
    end

    

end