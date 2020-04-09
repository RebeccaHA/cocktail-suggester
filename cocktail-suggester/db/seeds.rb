
# require 'pry'
# require 'csv'

# csv_text = CSV.read("db/cocktails.csv")
# csv = CSV.open('db/cocktails.csv', headers: :first_row).map(&:to_h)

#     csv.each do |row|
#         cocktail = Cocktail.new
#         cocktail.name = row['name']
#         cocktail.description = row['description']
#         cocktail.glassware = row['glassware']
#         cocktail.ingredients = row['ingredients']
#         cocktail.method = row['method']
#         cocktail.garnish = row['garnish']
#         cocktail.save
#         puts "#{cocktail.name} saved"
#     end
    
#     puts "There are now #{Cocktail.count} rows in the cocktails table"
Cocktail.create(name: "Cocktail 1", description:"Very nice cocktail", ingredients:"Apples, Lemon Juice, Cider, Lemonade", glassware: "cocktail glass", method: "shaken but not sturred", garnish:"lemon twist")
Cocktail.create(name: "Cocktail 2", description:"Very nice cocktail", ingredients:"Oranges, Melon, Cider, Lemonade", glassware: "cocktail glass", method: "shaken but not sturred", garnish:"Ice")
Cocktail.create(name: "Cocktail 3", description:"Very nice cocktail", ingredients:"Apples, Lemon Juice, Cider, Lemonade", glassware: "cocktail glass", method: "shaken but not sturred", garnish:"lemon twist")
Cocktail.create(name: "Cocktail 4", description:"Very nice cocktail", ingredients:"Nuts, Gin, Cider, Lemonade", glassware: "rum glass", method: "shaken but not sturred", garnish:"No Garnish")
Cocktail.create(name: "Cocktail 5", description:"Very nice cocktail", ingredients:"Yogurt, Lemon Juice, Cider, Lemonade", glassware: "cocktail glass", method: "shaken but not sturred", garnish:"lemon twist")
Cocktail.create(name: "Cocktail 6", description:"Very nice cocktail", ingredients:"Apples, Vodka, Cider, Lemonade", glassware: "flute", method: "shaken but not sturred", garnish:"No Garnish")
Cocktail.create(name: "Cocktail 7", description:"Very nice cocktail", ingredients:"Yogurt, Lemon Juice, Whisky", glassware: "cocktail glass", method: "shaken but not sturred", garnish:"lemon twist")

puts "made cocktails"