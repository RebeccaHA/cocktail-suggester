
require 'csv'

csv_text = File.read(Rails.root.join('db', 'seeds', 'cocktails.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

    csv.each do |row|
        t = Cocktail.new
        t.name = row['name']
        t.description = row['description']
        t.glasssare = row['glassware']
        t.ingredients = row['ingredients']
        t.method = row['method']
        t.garnish = row['garnish']
        
        puts "#{t.name} saved"
    end
    
    puts "There are now #{Cocktail.count} rows in the cocktails table"
  end