
require 'pry'
require 'csv'

csv_text = CSV.read("db/cocktails.csv")
binding.pry
csv = CSV.open('db/cocktails.csv', headers: :first_row).map(&:to_h)

    csv.each do |row|
        cocktail = Cocktail.new
        cocktail.name = row['name']
        cocktail.description = row['description']
        cocktail.glasssare = row['glassware']
        cocktail.ingredients = row['ingredients']
        cocktail.method = row['method']
        cocktail.garnish = row['garnish']
        cocktail.save
        puts "#{cocktail.name} saved"
    end
    
    puts "There are now #{Cocktail.count} rows in the cocktails table"
