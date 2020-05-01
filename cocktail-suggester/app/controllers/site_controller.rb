class SiteController < ApplicationController
    get '/about' do
     user = User.create
     user.id = session.id
     user.save
       
     @hero_body = "Cocktail Confidant"
     erb :'users/about'
    end


    get '/admin' do
    
     erb :'/users/admin'
    end
    
    post '/upload' do
     if params[:csv] && params[:csv][:filename]
      filename = params[:csv][:filename]
      file = params[:csv][:tempfile]
      path = "./db/#{filename}"
          
              # Write file to disk
     File.open(path, 'wb') do |f|
       f.write(file.read)
     end
    
        csv = CSV.open("db/#{filename}", headers: :first_row).map(&:to_h)

        csv.each do |row|
   
         recipe = Recipe.new
         recipe.name = row['name']
         recipe.description = row['description']
         recipe.ingredients= row['ingredients']
         recipe.method = row['method']
         recipe.save
          puts "#{recipe.name} saved"
        end
   

      end
    end
end
