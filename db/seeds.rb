require "open-uri"

User.destroy_all

user1 = User.create!({
  email: "maximerobertcolin@gmail.com",
  password: "123456"
})

user2 = User.create!({
  email: "huretantoine@gmail.com",
  password: "123456"
})

p "Created #{User.count} users"

Instrument.destroy_all

instruments = [
  {
    owner_id: user1.id,
    name: "Banjo",
    category: "String",
    price: 10,
    description: "ceci est un banjo",
    picture_url: "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSqHJspqLxk7fNj-mt_QcZQqsS-B4ui1ykrK8wzGztqPVnlJcFxawJ9DWOHiSHZNuP-"
  },
  {
    owner_id: user1.id,
    name: "Batterie",
    category: "Percussion",
    price: 20,
    description: "Ceci est une batterie",
    picture_url: "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSqHJspqLxk7fNj-mt_QcZQqsS-B4ui1ykrK8wzGztqPVnlJcFxawJ9DWOHiSHZNuP-"
  },
  {
    owner_id: user2.id,
    name: "Harpe",
    category: "String",
    price: 150,
    description: "Ceci est une harpe",
    picture_url: "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSqHJspqLxk7fNj-mt_QcZQqsS-B4ui1ykrK8wzGztqPVnlJcFxawJ9DWOHiSHZNuP-"
  },
  {
    owner_id: user2.id,
    name: "Violon",
    category: "String",
    price: 50,
    description: "Ceci est un violon",
    picture_url: "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSqHJspqLxk7fNj-mt_QcZQqsS-B4ui1ykrK8wzGztqPVnlJcFxawJ9DWOHiSHZNuP-"
  }
]

instruments.each do |i|
  file = URI.open(i[:picture_url])
  i.delete(:picture_url)
  instrument = Instrument.create(i)
  instrument.picture.attach(io: file, filename: "#{instrument.id}.png", content_type: "image/png")
end


p "Created #{Instrument.count} instruments"
