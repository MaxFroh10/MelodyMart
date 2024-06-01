require "open-uri"

Category.destroy_all

categories = ['String', 'Keyboard', 'Percussion', 'Wind', 'Electronic']

categories.each do |c|
  Category.create(name: c)
end

p "Created #{Category.count} categories"

Subcategory.destroy_all

subcategories = {
  "String" => ["Banjo", "Bass", "Cello", "Guitar", "Harp", "Mandolin", "Ukulele", "Violin"],
  "Keyboard" => ["Accordion", "Harpsichord", "Organ", "Piano", "Synthesizer"],
  "Percussion" => ["Drums", "Percussion", "Xylophone"],
  "Wind" => ["Clarinet", "Flute", "Oboe", "Saxophone", "Trumpet"],
  "Electronic" => ["Drum Machine", "Sampler", "Sequencer", "Synthesizer"]
}

subcategories.each do |category, subcategories|
  subcategories.each do |s|
    Subcategory.create(name: s, category: Category.find_by(name: category))
  end
end

p "Created #{Subcategory.count} instruments"

User.destroy_all

user1 = User.create!(
  {
    email: "maximerobertcolin@gmail.com",
    password: "123456",
    address: "4 RUE JACQUES LOUVEL-TESSIER",
    city: "Paris",
    state: "Ile de France",
    zip: "75010",
    country: "France",
    pseudo: "MadMax"
  }
)

user2 = User.create!(
  {
    email: "huretantoine@gmail.com",
    password: "123456",
    address: "10 Place de la Concorde",
    city: "Paris",
    state: "Ile de France",
    zip: "75008",
    country: "France",
    pseudo: "Tony"
  }
)

user3 = User.create!(
  {
    email: "maxence.frohlicher@icloud.com",
    password: "123456",
    address: "40 rue de Maubeuge",
    city: "Paris",
    state: "Ile de France",
    zip: "75009",
    country: "France",
    pseudo: "Maxou"
  }
)

user4 = User.create!(
  {
    email: "christophe.marco@net-c.fr",
    password: "123456",
    address: "2 place Léon-Blum",
    city: "Paris",
    state: "Ile de France",
    zip: "75011",
    country: "France",
    pseudo: "Toffy"
  }
)

p "Created #{User.count} users"

Instrument.destroy_all
instruments = [
  {
    owner_id: user1.id,
    name: "Piano",
    category: Category.find_by(name: "String"),
    subcategory: Subcategory.find_by(name: "Banjo"),
    price: 10,
    description: "ceci est un piano",
    picture_url: "https://source.unsplash.com/featured/500x500/?piano"
  },
  {
    owner_id: user1.id,
    name: "Guitare",
    category: Category.find_by(name: "Percussion"),
    subcategory: Subcategory.find_by(name: "Drums"),
    price: 20,
    description: "Ceci est une guitare",
    picture_url: "https://source.unsplash.com/featured/500x500/?guitare"
  },
  {
    owner_id: user2.id,
    name: "Saxophone",
    category: Category.find_by(name: "String"),
    subcategory: Subcategory.find_by(name: "Harp"),
    price: 150,
    description: "Ceci est un saxophone",
    picture_url: "https://source.unsplash.com/featured/500x500/?saxophone"
  },
  {
    owner_id: user2.id,
    name: "Clarinette",
    category: Category.find_by(name: "String"),
    subcategory: Subcategory.find_by(name: "Violin"),
    price: 50,
    description: "Ceci est une clarinette",
    picture_url: "https://source.unsplash.com/featured/500x500/?clarinet"
  },
  {
    owner_id: user3.id,
    name: "Batterie",
    category: Category.find_by(name: "Keyboard"),
    subcategory: Subcategory.find_by(name: "Piano"),
    price: 100,
    description: "Ceci est une batterie",
    picture_url: "https://source.unsplash.com/featured/500x500/?drum"
  },
  {
    owner_id: user3.id,
    name: "Accordéon",
    category: Category.find_by(name: "Keyboard"),
    subcategory: Subcategory.find_by(name: "Synthesizer"),
    price: 80,
    description: "Ceci est un accordéon",
    picture_url: "https://source.unsplash.com/featured/500x500/?accordion"
  },
  {
    owner_id: user4.id,
    name: "Violon",
    category: Category.find_by(name: "String"),
    subcategory: Subcategory.find_by(name: "Bass"),
    price: 30,
    description: "Ceci est un violon",
    picture_url: "https://source.unsplash.com/featured/500x500/?violon"
  }
]

instruments.each do |i|
  # Code to be secured against Injection, Dos, CRE and error management [CM]
  file = URI.open(i[:picture_url])
  i.delete(:picture_url)
  instrument = Instrument.create(i)
  instrument.picture.attach(io: file, filename: "#{instrument.id}.png", content_type: "image/png")
end

p "Created #{Instrument.count} instruments"
