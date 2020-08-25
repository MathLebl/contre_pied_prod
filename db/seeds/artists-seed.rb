require 'faker'

puts 'Creating 2 fake Jeune Public Artists...'
  artist = Artist.new(
    name:    Faker::Movies::HarryPotter.character,
    description: Faker::Lorem.paragraph(sentence_count: 15),
    style: Faker::Movies::HarryPotter.house,
    category:  "jeune_public",
    user_id: User.last.id
  )
artist.image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.banner_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image1.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image2.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image3.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image4.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
  artist.save!

artist = Artist.new(
  name:    Faker::Movies::StarWars.character,
  description: Faker::Lorem.paragraph(sentence_count: 15),
  style: Faker::Movies::StarWars.planet,
  category:  "jeune_public",
  user_id: User.last.id,
  active: false
)
artist.image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.banner_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image1.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image2.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image3.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image4.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.save!

puts "Jeune Public done"


