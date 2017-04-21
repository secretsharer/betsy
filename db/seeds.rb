# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


merchants = [
  {
    username: "Dan",
    email: "dan@betsy.com"
  },

  {
    username: "Jamie",
    email: "jamie@betsy.com",
    description: "I make haunting materials that are fun for all ghosts"
  },

  {
    username: "Kari",
    email: "kari@betsy.com",
    description: "I specialize in scary hats for ghosts"
  },

  {
  username: "Chris",
  email: "chris@betsy.com",
  description: "I've perfected invisible cheez-its for snacking on the job."
  },

  {
    username: "Casper",
    email: "casper@betsy.com",
    description: "Who says haunting has to be mean? I take a friendly approach to being a ghost."
  }

]

merchants.each do |merchant|
  Merchant.create(merchant)
end
