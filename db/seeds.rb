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
    description: "a beautiful spooky hat",
  },

  { name: "mirror lipstick",
    price: 9.95,
    quantity: 1000,
    merchant_id: 10,
    description:    "Are you 100% transparent and looking to discreetly scrawl that real-time scary message in the mirror right in front of someone's eyes? We’ve now extended our line of lipstick shades exclusively for this purpose!",
    image_url: "http://suziecheel.com/wp-content/uploads/2016/01/mirror-enough.jpg"
  },

  { name: "mini chalkboard",
    price: 9.95,
    quantity: 6,
    merchant_id: 12,
    description:    "Undersized, handheld chalk board. Sneak up behind someone and drag your 'nails' across this mini-slate. Mobile terror. Be *that* ghost",
    image_url: "http://factorydirectcraft.com/pimages/20120809085805-430997/mini_chalkboards_3.jpg"
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
  { name: "Levitator",
    price: 11.50,
    quantity: 23,
    merchant_id: 2,
    description: "move objects with ease"

  },
  { name: "pumpkin helmet",
    price: 9.75,
    quantity: 15,
    merchant_id: 2,
    description: "perfect for headless ghosts"

  },
  { name: "can of spirits",
    price: 4.15,
    quantity: 15,
    merchant_id: 3,
    description: "prank your friends at your next ghostly party. Spirits comein assorted shapes and sizes. Ten per can."

  },
  { name: "Sugar Bats",
    price: 0.75,
    quantity: 90,
    merchant_id: 4,
    description: "Delicious snack while waiting for your next spooking session"

  },
  { name: "Secret passageway",
    price: 63.45,
    quantity: 7,
    merchant_id: 5,
    description: "Create a portal from the basement to the bathroom with ease. (you don't need this product; you are a ghost who can travel through solid objects)."

  },

  { name: "Animated Skeleton",
    price: 40.00,
    quantity: 37,
    merchant_id: 1,
    description: "Perfect for popping out of backyard pet graves."
  },
  { name: "Army of Ghosts",
    price: 1500.00,
    quantity: 2,
    merchant_id: 3,
    description: "How else can we defeat Sauron?"
  },
  { name: "Frog",
    price: 2.00,
    quantity: 72,
    merchant_id: 1,
    description: "Perfect as a gift for the witches and wizards in your life."
  },
  { name: "Balloon Ghost",
    price: 3.50,
    quantity: 73,
    merchant_id: 1,
  },
  { name: "Potting Wheel",
    price: 400.00,
    quantity: 11,
    merchant_id: 5,

    description: "Use it to woo your love from beyond",
    image_url: "https://c1.staticflickr.com/7/6230/6296252809_76656f781b_b.jpg"
  },

  { name: "Casual Friday - 1000 Thread-Count Egyptian Cotton Sheet Set",
    price: 80.00,
    quantity: 10,
    merchant_id: 10,
    description: "Running short on time? Not feeling you look today? Consider going Classic! Get a helping hand from this traditional 1000 threat count egyptian cotton sheet set. Yield: Enough for you and a 'friend'",
    image_url: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=29005250"
  }
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
