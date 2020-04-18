
require 'pry'
require 'csv'


csv = CSV.open('db/cocktails_2.csv', headers: :first_row).map(&:to_h)

    csv.each do |row|
    binding.pry
        cocktail = Cocktail.new
        cocktail.name = row['name']
        cocktail.description = row['description']
        cocktail.glassware = row['glassware']
        cocktail.ingredients = row['ingredients']
        cocktail.method = row['method']
        cocktail.garnish = row['garnish']
        cocktail.save
        puts "#{cocktail.name} saved"
    end
    
    puts "There are now #{Cocktail.count} rows in the cocktails table"
