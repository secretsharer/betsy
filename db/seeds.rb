# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchants = [
  {
    name: "Dan",
    username: "dan",
    email: "dan@betsy.com",
    uid: 12,
    provider: 'github'
  },

  {
    name: "Jamie",
    username: "jamie",
    email: "jamie@betsy.com",
    description: "I make haunting materials that are fun for all ghosts",
    uid: 11,
    provider: 'github'
  },

  {
    name: "Kari",
    username: "kari",
    email: "kari@betsy.com",
    description: "I specialize in scary hats for ghosts",
    uid: 10,
    provider: 'github'
  },

  {
    name: "Chris",
    username: "chris",
    email: "chris@betsy.com",
    description: "I've perfected invisible cheez-its for snacking on the job.",
    uid: 14,
    provider: 'github'
  },

  {
    name: "Casper",
    username: "casper",
    email: "casper@betsy.com",
    description: "Who says haunting has to be mean? I take a friendly approach to being a ghost.",
    uid: 16,
    provider: 'github'
  }

]

merchants.each do |merchant|
  Merchant.create(merchant)
end


products = [
  { name: "ghost hat",
    price: 4.50,
    quantity: 10,
    merchant_id: 2,
    description: "a beautiful spooky hat"
  },

  { name: "haunted house",
    price: 300,
    quantity: 1,
    merchant_id: 4,
    description: "move-in ready"
  },

  { name: "purple crayon",
    price: 2.75,
    quantity: 15,
    merchant_id: 5,
    description: "made from high quality wax"

  },
]



products.each do |product|
  Product.create(product)
end


categories = [
  { name: "haunting"},
  { name: "anti human"},
  { name: "slime"},
  { name: "sound effects"},
  { name: "relics"},
  { name: "curses"},
  { name: "pranks"},
  { name: "chills"},
  { name: "anti-ghost detection"},

]

categories.each do |category|
  Category.create(category)
end
